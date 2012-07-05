# Ferrety
---------

### Overview

Ferrety is an information aggregator that's designed to reduce the amount of noise you get in your daily stream. It checks a variety of information portals using specific criteria that a user sets (called Instructions), and once a day turns that into a single digest. 

The chief advantage of Ferrety over other aggregator / alert systems is that with Ferrety you only get alerted on things that matter to you. For example, if you've got an Instruction to watch for weather over 90 degrees, and the high today is 87, you will get no alert about the weather. If none of your Instructions turn up results at all, you won't even get the email. There is no noise in Ferrety's output.

### Architecture

Ferrety is designed to be a distributed system. The "Command Center" is a thin Rails front end; it handles authentication, CRUD of Instructions, Alerts, and Reports, and also outbound mail. Sign-in is handled via Facebook.

There is also a Scheduler, which is fired off via a cron job, which picks up a list of runnable Instructions from the Command Center via a web API and loads them as jobs into a Resque queue.

Next in the chain come the Dispatchers. These are written as Resque workers, and can therefore be run in parallel with each other. The Dispatcher code includes a collection of "ferret" gems, each of which knows how to interact with a single information portal. The Dispatcher runs each Instruction with the appropriate ferret as a strategy pattern, and sends any resulting Alert back to the Command Center via a web API for recording alerts.

Finally, once per day, the Reporter fires off a request to the Command Center to compile and mail out all user reports. 

Currently, the Dispatcher makes use of three ferret gems: WeatherFerret, StockFerret, and FerretyFerret. FerretyFerret is a template from which all other ferrets inherit basic functions. The module also implements the HoneyBadger, a special strategy that does not use an API but rather scans a given web page for a given search term and alerts if the term is found.

Each of the Ferret gems can run on their own, and the specs on those will run out of the box. Getting the application running as a whole is infeasible, due to a lot of managed interactions (port numbers, environment variables, keys & passwords, supporting technologies, etc). 