user = User.create!(name: 'lucas', email: 'lucas@example.com', password: '123456789', password_confirmation: '123456789')
40.times { user.posts.create!(content: 'Hello world!') }
