# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# ruby encoding: utf-8

User.create(name: 'Monika Bauer', email: 'monika@gmail.com', country: 'austria', city: 'vienna', birthdate: Date.today - 25.years, sex: 1, password:'password',
            looking_for: 'Tanz (Breakdance, Hip – Hop), Akrobatik, Basketball, Fussball, American Football, Snowboarden, Ski-fahren, Klavier spielen, Licencse Klasse B',
            description: 'We love to sightsee as much as possible. Mariusz is a fun of nature whereas. We like to meet new people, talk to them and learn about their life in other countries.')


User.create(name: 'Franz Mueller', email: 'franz@gmail.com', country: 'austria', city: 'linz', birthdate: Date.today - 30.years, sex: 2,password:'password',
            looking_for: 'Biomechanik nach Meyerhold Synchronsprechen Maskenspiel, Clownerie Fechten, Stockkampf Pantomime Reiten',
            description: 'Im not a clubbing person. Sometimes I go out to restaurants, have some drinks, ..... but not to clubs / discos !! :)')

User.create(name: 'Sophie Haider', email: 'sophie@gmail.com', country: 'austria', city: 'linz', birthdate: Date.today - 20.years, sex: 2,password:'password',
            looking_for: 'Querfloete, Aereal Silk, klassisches Ballet, Jazzdance/ Contamporarydance, zeichnen, Fuehrerschein B',
            description: 'My personality type is dramatic, expressive, proud, and demanding.')

User.create(name: 'Hans Mitterlehner', email: 'hans@gmail.com', country: 'austria', city: 'vienna', birthdate: Date.today - 23.years, sex: 1,password:'password',
            looking_for: 'Gitarre, Performance, Dancing, Experimental Sounddesign, Acting',
            description: 'Only about 4percent of all people have my personality. I am Extroverted, Intuitive, Feeling, and Judging. ')

University.create(name: 'Angewandte')
University.create(name: 'Kunstuni Linz')
University.create(name: 'Bruckner Uni')