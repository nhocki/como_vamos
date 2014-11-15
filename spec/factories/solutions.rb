FactoryGirl.define do
  factory :solution do
    user
    problem
    explanation "MyText"
    source_code do
      Rack::Test::UploadedFile.new(File.open(Rails.root.join(*%w(spec fixtures CD_sample.cpp))))
    end
  end
end
