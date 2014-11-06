FactoryGirl.define do
  factory :problem do
    judge
    number "11512"
    title { generate(:name) }
    url  { generate(:url) }
    association :creator, factory: :user
  end
end
