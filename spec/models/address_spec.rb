require 'rails_helper'
describe Address do
  describe '#create' do
    it "prefecture_id,city,family_name,last_name,postal_code,banti,building_name,phone_number,user_idが存在すれば登録できる" do
      address = build(:address)
      address.valid?
      expect(address).to be_valid
    end

    it "family_nameが空だと登録されない" do
      address = build(:address, family_name: nil)
      address.valid?
      expect(address.errors[:family_name]).to include("を入力してください")
    end

    it "last_nameが空だと登録されない" do
      address = build(:address, last_name: nil)
      address.valid?
      expect(address.errors[:last_name]).to include("を入力してください")
    end

    it "postal_codeが空だと登録されない" do
      address = build(:address, postal_code: nil)
      address.valid?
      expect(address.errors[:postal_code]).to include("を入力してください")
    end

    it "prefecture_idが空だと登録されない" do
      address = build(:address, prefecture_id: nil)
      address.valid?
      expect(address.errors[:prefecture_id]).to include("を入力してください")
    end

    it "cityが空だと登録されない" do
      address = build(:address, city: nil)
      address.valid?
      expect(address.errors[:city]).to include("を入力してください")
    end

    it "bantiが空だと登録されない" do
      address = build(:address, banti: nil)
      address.valid?
      expect(address.errors[:banti]).to include("を入力してください")
    end

    it "building_nameが空だと登録されない" do
      address = build(:address, building_name: nil)
      address.valid?
      expect(address.errors[:building_name]).to include("を入力してください")
    end

    it "phone_numberが空だと登録されない" do
      address = build(:address, phone_number: nil)
      address.valid?
      expect(address.errors[:phone_number]).to include("を入力してください")
    end

    it "phone_numberが10文字だと登録できる" do
      address = build(:address, phone_number: "0000000000")
      address.valid?
      expect(address).to be_valid
    end

    it "phone_numberが11文字以上だと登録されない" do
      address = build(:address, phone_number: "00000000000")
      address.valid?
      expect(address).to be_valid
    end

    it "phone_numberが9文字だと登録されない" do
      address = build(:address, phone_number: "000000000")
      address.valid?
      expect(address.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberが12文字だと登録されない" do
      address = build(:address, phone_number: "000000000000")
      address.valid?
      expect(address.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberが数字以外だと登録されない" do
      address = build(:address, phone_number: "abcabcabca")
      address.valid?
      expect(address.errors[:phone_number]).to include("は不正な値です")
    end
  end
end