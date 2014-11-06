FactoryGirl.define do
  factory :user do
    provider 'github'
    provider_uid { generate(:uid) }
    name "Mr. Juaco"
    email { generate(:email) }
    username { "user#{generate(:uid)}" }
  end
end
