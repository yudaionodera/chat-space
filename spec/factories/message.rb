FactoryGirl.define do

  factory :message do
    # id "1"
    body "aaa"
    image Rack::Test::UploadedFile.new(File.join(Rails.root, 'spec/fixture/images/image.jpg'))
    # image { fixture_file_upload("spec/fixture/images/image.jpg", 'image/jpg') }
    # avatar { fixture_file_upload Rails.root.join('path', 'to', 'avatar.png'), '/images/image.jpg' }
    # image "20171121212351.jpg"
    group_id "2"
    user_id "1"
    created_at "2016-01-01T00:00:00Z"
    updated_at "2016-01-01T00:00:00Z"
  end
end
