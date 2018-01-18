FactoryGirl.define do
 factory :user do
    name { Faker::Name.name }
    email 'foo@bar.com'
    password 'foobar'
  end

  factory :randome_user, class: User do 
		name {Faker::Name.first_name}
		email {Faker::Internet.email}
		password {Faker::Internet.password}
		active true
	end
end
