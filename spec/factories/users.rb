FactoryGirl.define do
  sequence :uid do |n|
    "uid_#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end

  factory :user do
    provider 'github'
    provider_uid { generate(:uid) }
    name "Mr. Juaco"
    email { generate(:email) }
    username { "user#{generate(:uid)}" }
  end
end
