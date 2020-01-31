# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).

mike = Shelter.create(name: "Mike's Shelter",
                      address: '1331 17th Street',
                      city: 'Denver',
                      state: 'CO',
                      zip: '80202')

meg = Shelter.create(name: "Meg's Shelter",
                     address: '150 Main Street',
                     city: 'Hershey',
                     state: 'PA',
                     zip: '17033')

# Mike's Shelter has one pet, Athena, 1 year old, female, description: butthead
Pet.create(image: 'https://www.talenthounds.ca/wp-content/uploads/2014/02/1010297_10151682411488254_1369748570_n.jpg',
           name: 'Athena',
           description: 'butthead',
           age: '1',
           sex: 'female',
           status: 'false',
           shelter_id: mike.id)

Pet.create(image: 'https://qph.fs.quoracdn.net/main-qimg-93bfd510cdebb550b6d46a2455d3c39a',
           name: 'Odell',
           description: 'good dog',
           age: '4',
           sex: 'male',
           status: 'false',
           shelter_id: meg.id)
