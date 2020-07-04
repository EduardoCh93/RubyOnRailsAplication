u1 = User.create!(name: 'joaquin', email: 'joaquinhhh@fiuba.com', password: '123456789', password_confirmation: '123456789')
u2 = User.create!(name: 'pedro', email: 'pedro@fiuba.com', password: '123456789', password_confirmation: '123456789')
u3 = User.create!(name: 'pepe', email: 'jajaja@fiuba.com', password: '123456789', password_confirmation: '123456789')

Follower.create!(name: 'pepe', user_id: u1.id)
Follower.create!(name: 'juan', user_id: u1.id)
Follower.create!(name: 'pedro', user_id: u1.id)
Follower.create!(name: 'josesito', user_id: u2.id)
Follower.create!(name: 'qqq', user_id: u2.id)

Following.create!(name: 'pepe', user_id: u1.id)
Following.create!(name: 'pedro', user_id: u1.id)
Following.create!(name: 'pepe', user_id: u2.id)
Following.create!(name: 'joaquin', user_id: u2.id)
Following.create!(name: 'joaquin', user_id: u3.id)

