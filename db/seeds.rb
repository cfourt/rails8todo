# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

now = Time.current

{ "Don't forget the milk" => {details: "1 Gal, Regular or Almond", due_date: now + 1.day},
 "Make a sandwich" => {details: "PB&J", due_date: now + 1.day},
 "Do 20 push-ups" => {details: "Or at least 2 :)", due_date: now + 1.day},
 "Relax" => {details: "You're doing great", due_date: now + 1.day} ,
 "Past Due!" => {details: "You're doing great", due_date: now - 1.day} ,
}.each do |title, attrs|
  Task.find_or_create_by!(
    title: title,
    details: attrs[:details],
    due_date: attrs[:due_date]
    )
end
