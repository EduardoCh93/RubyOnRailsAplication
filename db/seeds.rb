user = User.create!(name: 'lucas', email: 'lucas@example.com', password: '123456789', password_confirmation: '123456789')
40.times { user.posts.create!(content: 'Hello world!') }
user.posts.create!(content: "Un apostador de Río Negro ganó 43 millones de pesos en el Quini 6. El hombre se llevó el pozo que salió de la modalidad 'Segunda Vuelta'.")
user.posts.create!(content: 'Erre con erre guitarra, erre con erre barril. Qué rápido ruedan las rápidas ruedas del rápido del ferrocarril.')
