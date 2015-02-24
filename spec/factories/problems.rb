FactoryGirl.define do
  factory :problem do
    judge
    number "11512"
    difficulty_level { Problem::DIFFICULTY_MAP.keys.sample }
    title { generate(:name) }
    url  { generate(:url) }
    association :creator, factory: :user
  end
end
