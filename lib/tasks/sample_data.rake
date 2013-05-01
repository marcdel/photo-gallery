namespace :db do
  desc 'Fill database with sample data'
  task populate: :environment do
    #make_admins
    #make_users
    make_prints
  end

  def make_admins
    #admin = User.create!(name: 'Admin User', email: 'admin@email.com', password: 'password', password_confirmation: 'password')
    admin = User.create!(name: 'Admin User', email: 'admin@email.com',
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

  def make_prints
    Print.create!(width: 8, height: 12, price: 20)
    Print.create!(width: 12, height: 18, price: 30)
    Print.create!(width: 16, height: 24, price: 60)
    Print.create!(width: 20, height: 30, price: 90)
    Print.create!(width: 20, height: 30, print_type: "Canvas", price: 250)
    Print.create!(width: 16, height: 24, print_type: "Metal", price: 300)
    Print.create!(width: 20, height: 30, print_type: "Metal", price: 450)
    Print.create!(width: 24, height: 36, print_type: "Metal", price: 600)
    Print.create!(width: 26, height: 12, print_type: "Panoramic", price: 90)
    Print.create!(width: 36, height: 12, print_type: "Panoramic", price: 110)
  end
end
