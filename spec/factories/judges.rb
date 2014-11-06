FactoryGirl.define do
  factory :judge do
    name { generate(:name) }
    url  { generate(:url) }
    problems_count 1
  end
end
