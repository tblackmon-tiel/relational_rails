# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

flock_1 = Flock.create(name: "Chicken's Flock", cage_number: 1, accepts_new_birds: true)
flock_2 = Flock.create(name: "A Random Flock", cage_number: 2, accepts_new_birds: true)
flock_3 = Flock.create(name: "Sensitive Flock", cage_number: 5, accepts_new_birds: false)

Bird.create(name: "Chicken", flock_id: flock_1.id, band_id: 273, age: 6, is_bonded: true)
Bird.create(name: "Kiwi", flock_id: flock_1.id, band_id: 23, age: 5, is_bonded: true)
Bird.create(name: "Coco", flock_id: flock_1.id, band_id: 10, age: 4, is_bonded: true)
Bird.create(name: "Hiccup", flock_id: flock_2.id, band_id: 7, age: 10, is_bonded: true)
Bird.create(name: "Crow", flock_id: flock_3.id, band_id: 90, age: 1, is_bonded: false)
Bird.create(name: "Pigeon", flock_id: flock_3.id, band_id: 91, age: 1, is_bonded: false)