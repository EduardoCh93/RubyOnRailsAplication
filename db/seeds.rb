user_a_seguir = User.create!(name: 'joaquin', email: 'joaquinhhh@fiuba.com', password: '123456789', password_confirmation: '123456789')
user_logueado = User.create!(name: 'pedro', email: 'pedro@fiuba.com', password: '123456789', password_confirmation: '123456789')
u1 = User.create!(name: 'fulano', email: 'fulano@fiuba.com', password: '123456789', password_confirmation: '123456789')
u2 = User.create!(name: 'susana', email: 'susana@fiuba.com', password: '123456789', password_confirmation: '123456789')
u3 = User.create!(name: 'pepe', email: 'jajaja@fiuba.com', password: '123456789', password_confirmation: '123456789')

# 'user_logueado' sigue a 'user_a_seguir'
Following.create!(name: user_a_seguir.name, id_usuario: user_a_seguir.id, user_id: user_logueado.id)
Follower.create!(name: user_logueado.name, id_usuario: user_logueado.id, user_id: user_a_seguir.id)

# U3 sigue a U2
Following.create!(name: u2.name, id_usuario: u2.id, user_id: u3.id)
Follower.create!(name: u3.name, id_usuario: u3.id, user_id: u2.id)

user = User.create!(name: 'lucas', email: 'lucas@example.com', password: '123456789', password_confirmation: '123456789')
40.times { user.posts.create!(content: 'Hello world!') }
user.posts.create!(content: "Un apostador de Río Negro ganó 43 millones de pesos en el Quini 6. El hombre se llevó el pozo que salió de la modalidad 'Segunda Vuelta'.")
user.posts.create!(content: 'Erre con erre guitarra, erre con erre barril. Qué rápido ruedan las rápidas ruedas del rápido del ferrocarril.')
