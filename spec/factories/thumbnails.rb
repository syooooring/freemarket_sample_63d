FactoryBot.define do

  factory :thumbnail do
    images   {Rack::Test::UploadedFile.new(File.join(Rails.root, "spec/fixtures/gettyimages-890147976-612x612.jpg"))}
    item
  end

end