require 'rails_helper'
describe Item do
  describe '#update' do
    it "nameが空だとバリデーション" do
     item = build(:item, name: "")
     item.valid?
     expect(item.errors[:name]).to include("can't be blank")
    end
  #   it "priceが空だとバリデーション" do
  #     item = build(:item,price: "")
  #     item.valid?
  #     expect(item.errors[:price]).to include("can't be blank")
  #    end
  #    it "delivery_idが空だとバリデーション" do
  #     item = build(:item,delivery_id: "")
  #     item.valid?
  #     expect(item.errors[:delivery_id]).to include("can't be blank")
  #    end
  # end
  end
# require 'rails_helper'

# describe Item do
#   describe '#update' do

#     it "アイテムの名前テスト" do
#       item = build(:item, name: nil)
#       item.valid?
#       expect(user.errors[:name]).to include("can't be blank")
#     end

#     it "アイテムのプライステスト" do
#       item = build(:item, price: nil)
#       item.valid?
#       expect(user.errors[:price]).to include("can't be blank")
#     end

#   end
end