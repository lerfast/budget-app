# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
# create groups
group1 = Group.find_or_create_by!(name: 'Home')
group1.icon = "https://cdn-icons-png.flaticon.com/512/2358/2358579.png"
group2 = Group.find_or_create_by!(name: 'Clothes')
group2.icon = "https://cdn-icons-png.flaticon.com/512/5662/5662223.png"
group3 = Group.find_or_create_by!(name: 'Medical')
group3.icon = "https://cdn-icons-png.flaticon.com/512/6694/6694730.png"