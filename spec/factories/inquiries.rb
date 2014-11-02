FactoryGirl.define do
  factory :inquiry do
    name { Faker::Name.name }
    email { Faker::Internet.email }
    phone { '0' + %w(50 70 80 90 3 6 78).sample + ['', '-'].sample + Random.rand(100 ... 10000).to_s + ['', '-'].sample + Random.rand(100 ... 10000).to_s }
    message { Faker::Lorem.paragraph }
  end
end
