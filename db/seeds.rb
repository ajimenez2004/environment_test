# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).

if Rails.env.production?
  titles = [
    "Production Book: The Pragmatic Programmer",
    "Production Book: Clean Code",
    "Production Book: Design Patterns",
    "Production Book: Refactoring",
    "Production Book: The Mythical Man-Month"
  ]
else
  titles = [
    "The life of a turtle",
    "The mirror, the lion and the audacity of the little dog",
    "Origami for cats",
    "The weight of a hundred kilograms",
    "Aggie Ring Day Survival Guide"
  ]
end

titles.each do |title|
  Book.find_or_create_by!(title: title)
end
