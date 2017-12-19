# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.destroy_all
Sport.destroy_all
UserSport.destroy_all
Invitation.destroy_all
Comment.destroy_all
Event.destroy_all

sports = ['Fútbol',
          'Tenis',
          'Ping-Pong',
          'Bicicleta',
          'Correr']
sports_image = ['football.png',
                'tennis.png',
                'ping-pong.png',
                'bike.png',
                'running.png']

user_comments = ['']
sports.length.times do |i|
  Sport.create(name: sports[i],
               image: sports_image[i],
               state: true)
end
latituds = [-33.438911, -33.437648, -33.440397, -33.435133, -33.436314, 
            -33.428267, -33.436895, -33.434290, -33.429698]
longituds = [-70.658448, -70.656807, -70.653813, -70.660862, -70.650026, 
             -70.602534, -70.600315, -70.582596, -70.617240]
9.times do |i|
  User.create(name: Faker::Name.name,
              gender: [0, 1].sample,
              age: [*18..99].sample,
              email: "email1#{i}@gmail.com",
              password: '123456',
              latitude: latituds[i],
              longitude: longituds[i])
end

20.times do
  UserSport.create(user_id: User.all.pluck(:id).sample,
                   sport_id: Sport.all.pluck(:id).sample,
                   expertice: [1, 2, 3, 4, 5, 6, 7, 8, 9].sample)
end

UserSport.dedupe

comment_contents = ['llega a la hora',
                    'no paga su parte después del partido',
                    'Se portó súper bien, nos llev+ó en auto',
                    'va a todas siempre....',
                    'te pasaste compadre.. estuvo bueno el tenis',
                    'demasiado bueno en ping pong, debería ser profesional',
                    'un abrazo, tengo una nueva amiga para salir a correr' ,
                    'corrimos 1 hora, y no se cansó' ]

User.all.each do |user|
  Comment.create(user_id: user.id, from: User.where.not(id: Comment.all.pluck(:id)).pluck(:id).sample, content: comment_contents.sample)  
end