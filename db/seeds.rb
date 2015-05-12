# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby encoding: utf-8

#University.create(name: 'Angewandte')
#University.create(name: 'Kunstuni Linz')
#University.create(name: 'Bruckner Uni')

skill = Skill.find_or_initialize_by_name('Dancer')
skill.name = 'Dancer'
skill.save!

skill = Skill.find_or_initialize_by_name('Actor / Actress')
skill.name = 'Actor / Actress'
skill.save!

skill = Skill.find_or_initialize_by_name('Author')
skill.name = 'Author'
skill.save!

skill = Skill.find_or_initialize_by_name('Filmmaker')
skill.name = 'Filmmaker'
skill.save!

skill = Skill.find_or_initialize_by_name('Camera')
skill.name = 'Camera'
skill.save!

skill = Skill.find_or_initialize_by_name('Postproduction')
skill.name = 'Postproduction'
skill.save!

skill = Skill.find_or_initialize_by_name('Animator')
skill.name = 'Animator'
skill.save!

skill = Skill.find_or_initialize_by_name('Lightdesigner')
skill.name = 'Lightdesigner'
skill.save!

skill = Skill.find_or_initialize_by_name('Sounddesigner')
skill.name = 'Sounddesigner'
skill.save!

skill = Skill.find_or_initialize_by_name('Musician')
skill.name = 'Musician'
skill.save!

skill = Skill.find_or_initialize_by_name('Developer')
skill.name = 'Developer'
skill.save!

skill = Skill.find_or_initialize_by_name('Visual artist')
skill.name = 'Visual artist'
skill.save!

skill = Skill.find_or_initialize_by_name('Drawer')
skill.name = 'Drawer'
skill.save!

#User.create(name: 'Monika Bauer', email: 'monika@gmail.com', country: 'austria', city: 'vienna', sex: 1, password:'password', looking_for: 'Tanz (Breakdance, Hip – Hop), Akrobatik, Basketball, Fussball, American Football, Snowboarden, Ski-fahren, Klavier spielen, Licence Klasse B', description: 'We love to sightsee as much as possible. Mariusz is a fun of nature whereas. We like to meet new people, talk to them and learn about their life in other countries.')
