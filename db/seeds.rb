user = User.create(uid: "fake", first_name: "Fakey", last_name: "McFakerton", email: "Fakey@fallingfoundry.com")
stock_instruction = user.instructions.create!(ferret_type: "StockFerret", params: {instruction: "Change", low_threshold: -1, high_threshold: 1, symbol: ".dji"})
weather_instruction = user.instructions.create!(ferret_type: "WeatherFerret", params: {term: "storm", low_threshold: 50, high_threshold: 90, zip: '97086'})
honeybadger_instruction = user.instructions.create!(ferret_type: "HoneyBadger", params: {url: "http://www.hungryacademy.com/", term: "hungry"})

  alert = stock_instruction.alerts.create(body: "Sample stock alert! Buy Buy Buy!")
  alert2 = weather_instruction.alerts.create(body: "It's hot in Topeka")
  alert3 = honeybadger_instruction.alerts.create(body: "I'm a honey badger.")

  user.generate_report

test_user = User.create(uid: "test", first_name: "Testy", last_name: "McTestington", email: "Testy@fallingfoundry.com")
#These three should always generate an alert
test_stock_instruction = test_user.instructions.create!(ferret_type: "StockFerret", params: {instruction: "Value", low_threshold: 0, high_threshold: 1, symbol: "rad"})
test_weather_instruction = test_user.instructions.create!(ferret_type: "WeatherFerret", params: {term: "storm", low_threshold: 0, high_threshold: 30, zip: '97086'})
test_honeybadger_instruction = test_user.instructions.create!(ferret_type: "HoneyBadger", params: {url: "http://www.hungryacademy.com/", term: "hungry"})

#This should not fire; it has run too recently
faux_stock_instruction = test_user.instructions.create!(ferret_type: "StockFerret", params: {instruction: "Value", low_threshold: 0, high_threshold: 1, symbol: ".dji"}, last_run: DateTime.now)

#This should not fire; it has an old news alert
faux_weather_instruction = test_user.instructions.create!(ferret_type: "WeatherFerret", params: {term: "storm", low_threshold: 0, high_threshold: 30, zip: '20740'})
faux_weather_instruction.alerts.create(body: "I was made in the Seeds file")

# After running a scheduler and a dispatcher process,
# User.find_by_uid("test").generate_report
# should generate a new report with three alerts.