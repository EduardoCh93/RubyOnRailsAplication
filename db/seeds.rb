u1 = User.create!(name: 'joaquin', email: 'joaquinhhh@fiuba.com', password: '123456789', password_confirmation: '123456789')
u2 = User.create!(name: 'pedro', email: 'pedro@fiuba.com', password: '123456789', password_confirmation: '123456789')
u3 = User.create!(name: 'pepe', email: 'jajaja@fiuba.com', password: '123456789', password_confirmation: '123456789')

Follower.create!(name: 'pepe',id_usuario: 3, user_id: u1.id)
Follower.create!(name: 'pedro',id_usuario: 2, user_id: u1.id)

Following.create!(name: 'pepe', id_usuario: 3, user_id: u1.id)
Following.create!(name: 'pedro', id_usuario: 2, user_id: u1.id)
Following.create!(name: 'pepe', id_usuario: 3, user_id: u2.id)
Following.create!(name: 'joaquin', id_usuario: 1, user_id: u2.id)
Following.create!(name: 'joaquin', id_usuario: 1, user_id: u3.id)

user = User.create!(name: 'lucas', email: 'lucas@example.com', password: '123456789', password_confirmation: '123456789')
40.times { user.posts.create!(content: 'Hello world!') }
user.posts.create!(content: "Un apostador de Río Negro ganó 43 millones de pesos en el Quini 6. El hombre se llevó el pozo que salió de la modalidad 'Segunda Vuelta'.")
user.posts.create!(content: 'Erre con erre guitarra, erre con erre barril. Qué rápido ruedan las rápidas ruedas del rápido del ferrocarril.')
