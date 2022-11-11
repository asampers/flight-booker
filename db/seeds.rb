# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

Airport.find_or_create_by(code: "SFO", location: "San Francisco, CA")
Airport.find_or_create_by(code: "NYC", location: "New York City, NY")
Airport.find_or_create_by(code: "ATL", location: "Atlanta, GA")
Airport.find_or_create_by(code: "ORD", location: "Chicago, IL")
Airport.find_or_create_by(code: "LAX", location: "Los Angeles, CA")
Airport.find_or_create_by(code: "DFW", location: "Dallas, TX")
Airport.find_or_create_by(code: "MCO", location: "Orlando, FL")
Airport.find_or_create_by(code: "DEN", location: "Denver, CO")

puts 'Created 8 airports'

#start = Time.zone.today
#finish = Time.zone.today + 31.days