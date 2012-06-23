# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stock_instruction = Instruction.create!(user_id: 1, ferret_type: "stock", params: {term: "CHANGE", low_threshold: -1, high_threshold: 1, symbol: ".dji"}.to_json)
weather_instruction = Instruction.create!(user_id: 1, ferret_type: "weather", params: {term: "storm", low_threshold: 50, high_threshold: 90}.to_json)
