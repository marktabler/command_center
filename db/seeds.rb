# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.create(uid: "fake", first_name: "Fakey", last_name: "McFakerton", email: "Fakey@fallingfoundry.com")
stock_instruction = user.instructions.create!(ferret_type: "StockFerret", params: {instruction: "Change", low_threshold: -1, high_threshold: 1, symbol: ".dji"})
weather_instruction = user.instructions.create!(ferret_type: "WeatherFerret", params: {term: "storm", low_threshold: 50, high_threshold: 90, zip: '97086'})
honeybadger_instruction = user.instructions.create!(ferret_type: "HoneyBadger", params: {url: "http://www.hungryacademy.com/", term: "hungry"})

  alert = stock_instruction.alerts.create(body: "Sample stock alert! Buy Buy Buy!")
  alert2 = weather_instruction.alerts.create(body: "It's hot in Topeka")
  alert3 = honeybadger_instruction.alerts.create(body: "I'm a honey badger.")

  user.generate_report
