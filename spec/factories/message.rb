FactoryGirl.define do

  factory :message do
    body "aaa"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/images/image.jpg'))
    group_id "1"
    user_id "1"
    created_at "2016-01-01T00:00:00Z"
    updated_at "2016-01-01T00:00:00Z"
  end
end