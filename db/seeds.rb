# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Service.create(name: "Bathroom Remodel", description: "Complete Bathroom Renovation")
Service.create(name: "Kitchen Remodel", description: "Complete Kitchen Renovation")
Service.create(name: "Floor Installation", description: "Installation of Flooring of choice, (e.g. Tile, Hardwood) in one room up to 150 square feet.")
Service.create(name: "Window Installation", description: "Installation of a Window, either single pane, double pane or bay.")
Service.create(name: "Deck Repair/Installation", description: "Repair or Installation of Decking in either the front or back of building.")
Service.create(name: "Wall Repair", description: "Repair/Patch of damages on a single Wall")
Service.create(name: "Drywall Installation", description: "Installation of a single wall.")
Service.create(name: "Room Addition", description: "Room created within existing building square footage.")
Service.create(name: "Cabinet Installation", description: "Installation of pre-assembled cabinetry.")
Service.create(name: "Painting", description: "Primer and Paint in one room up to 150 square feet.")