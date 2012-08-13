namespace :db do      
  desc "Fill database with sample data"
  task populate: :environment do
    User.create!(username: "Example",
                 email: "example@railstutorial.org",
                 password: "foobar",
                 password_confirmation: "foobar",
                 firstname: "Example",
                 lastname: "sample")

    admin.toggle!(:admin)

    99.times do |n|
     username  = Faker::Name.name
      email = "example-#{n+1}@railstutorial.org"
      password  = "password"
      firstname = "Example"
      lastname = "sample"
      User.create!(username: username,
                   email: email,
                   password: password,
                   password_confirmation: password,
                   firstname: firstname,
                   lastname: lastname)
    end
  end
end