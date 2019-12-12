require 'rails_helper'
describe Thumbnail do
  describe '#create' do
    it "imagesが存在すれば登録できる" do
      thumbnail = build(:thumbnail)
      thumbnail.valid?
      expect(thumbnail).to be_valid
    end
  end
end