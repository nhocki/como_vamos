FactoryGirl.define do
  factory :category do
    name { generate(:name) }
  end
end
