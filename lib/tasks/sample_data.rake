namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    #make_admins
    #make_users
  end

  def make_admins
    admin = User.create!(name: 'Admin User',
                         email: 'admin@email.com',
                         password: 'password',
                         password_confirmation: 'password')
    admin.toggle!(:admin)
  end

  def make_users
    User.create!(name: 'Fake User',
                 email: 'user@email.com',
                 password: 'password',
                 password_confirmation: 'password')

    99.times do |n|
      name  = Faker::Name.name
      email = "user#{n+1}@email.com"
      password  = 'password'
      User.create!(name: name,
                   email: email,
                   password: password,
                   password_confirmation: password)
    end
  end
end