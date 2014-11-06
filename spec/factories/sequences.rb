FactoryGirl.define do
  sequence :uid do |n|
    "uid_#{n}"
  end

  sequence :email do |n|
    "email#{n}@example.com"
  end

  sequence :name do |n|
    "Random Name #{n}"
  end

  sequence :url do |n|
    "example_#{n}.com"
  end
end
