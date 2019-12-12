require 'rails_helper'
describe User do
  describe '#create' do
    it "email,password,nickname,family_name,last_name,j_family_name,j_last_name,birthday_year_id,birthday_month_id,birthday_day_id,phone_numberが存在すれば登録できる" do
      user = build(:user)
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが空だと登録されない" do
      user = build(:user, nickname: nil)
      user.valid?
      expect(user.errors[:nickname]).to include("を入力してください")
    end

    it "nicknameが20文字以下だと登録できる" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user).to be_valid
    end

    it "nicknameが21文字以上だと登録されない" do
      user = build(:user, nickname: "aaaaaaaaaaaaaaaaaaaaa")
      user.valid?
      expect(user.errors[:nickname]).to include("は20文字以内で入力してください")
    end

    it "emailが空だと登録されない" do
      user = build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end
    
    it "emailが重複すると登録できない" do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end

    it "passwordが空だと登録されない" do
      user = build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "introductonが空でも登録できる" do
      user = build(:user, introduction: nil)
      user.valid?
      expect(user).to be_valid
    end

    it "family_nameが空だと登録されない" do
      user = build(:user, family_name: nil)
      user.valid?
      expect(user.errors[:family_name]).to include("を入力してください")
    end

    it "family_nameが35文字以下だと登録できる" do
      user = build(:user, family_name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
      user.valid?
      expect(user).to be_valid
    end

    it "family_nameが36文字以上だと登録されない" do
      user = build(:user, family_name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあ")
      user.valid?
      expect(user.errors[:family_name]).to include("は35文字以内で入力してください")
    end

    it "family_nameが全角ひらがなだと登録できる" do
      user = build(:user, family_name: "あいうえお")
      user.valid?
      expect(user).to be_valid
    end

    it "family_nameが全角漢字だと登録できる" do
      user = build(:user, family_name: "山田")
      user.valid?
      expect(user).to be_valid
    end

    it "family_nameが半角アルファベットだと登録されない" do
      user = build(:user, family_name: "aiueo")
      user.valid?
      expect(user.errors[:family_name]).to include("は不正な値です")
    end

    it "last_nameが空だと登録されない" do
      user = build(:user, last_name: nil)
      user.valid?
      expect(user.errors[:last_name]).to include("を入力してください")
    end

    it "last_nameが35文字以下だと登録できる" do
      user = build(:user, last_name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえお")
      user.valid?
      expect(user).to be_valid
    end

    it "last_nameが36文字以上だと登録されない" do
      user = build(:user, last_name: "あいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあいうえおあ")
      user.valid?
      expect(user.errors[:last_name]).to include("は35文字以内で入力してください")
    end

    it "last_nameが全角ひらがなだと登録できる" do
      user = build(:user, last_name: "あいうえお")
      user.valid?
      expect(user).to be_valid
    end

    it "last_nameが全角漢字だと登録できる" do
      user = build(:user, last_name: "山田")
      user.valid?
      expect(user).to be_valid
    end

    it "last_nameが半角アルファベットだと登録されない" do
      user = build(:user, last_name: "aiueo")
      user.valid?
      expect(user.errors[:last_name]).to include("は不正な値です")
    end

    it "j_family_nameが空だと登録されない" do
      user = build(:user, j_family_name: nil)
      user.valid?
      expect(user.errors[:j_family_name]).to include("を入力してください")
    end

    it "j_family_nameが35文字以下だと登録できる" do
      user = build(:user, j_family_name: "アイウエオアイウエオアイウエオアイウエオアイウエオアイウエオアイウエオ")
      user.valid?
      expect(user).to be_valid
    end

    it "j_family_nameが36文字以上だと登録されない" do
      user = build(:user, j_family_name: "アイウエオアイウエオアイウエオアイウエオアイウエオアイウエオアイウエオア")
      user.valid?
      expect(user.errors[:j_family_name]).to include("は35文字以内で入力してください")
    end

    it "j_family_nameが全角カタカナだと登録できる" do
      user = build(:user, j_family_name: "アイウエオ")
      user.valid?
      expect(user).to be_valid
    end

    it "j_family_nameが半角アルファベットだと登録されない" do
      user = build(:user, j_family_name: "aiueo")
      user.valid?
      expect(user.errors[:j_family_name]).to include("は不正な値です")
    end

    it "j_last_nameが空だと登録されない" do
      user = build(:user, j_last_name: nil)
      user.valid?
      expect(user.errors[:j_last_name]).to include("を入力してください")
    end

    it "j_last_nameが35文字以下だと登録できる" do
      user = build(:user, j_last_name: "アイウエオアイウエオアイウエオアイウエオアイウエオアイウエオアイウエオ")
      user.valid?
      expect(user).to be_valid
    end

    it "j_last_nameが36文字以上だと登録されない" do
      user = build(:user, j_last_name: "アイウエオアイウエオアイウエオアイウエオアイウエオアイウエオアイウエオア")
      user.valid?
      expect(user.errors[:j_last_name]).to include("は35文字以内で入力してください")
    end

    it "j_last_nameが全角カタカナだと登録できる" do
      user = build(:user, j_last_name: "アイウエオ")
      user.valid?
      expect(user).to be_valid
    end

    it "j_last_nameが半角アルファベットだと登録されない" do
      user = build(:user, j_last_name: "aiueo")
      user.valid?
      expect(user.errors[:j_last_name]).to include("は不正な値です")
    end

    it "birthday_year_idが空だと登録されない" do
      user = build(:user, birthday_year_id: nil)
      user.valid?
      expect(user.errors[:birthday_year_id]).to include("を入力してください")
    end

    it "birthday_month_idが空だと登録されない" do
      user = build(:user, birthday_month_id: nil)
      user.valid?
      expect(user.errors[:birthday_month_id]).to include("を入力してください")
    end

    it "birthday_day_idが空だと登録されない" do
      user = build(:user, birthday_day_id: nil)
      user.valid?
      expect(user.errors[:birthday_day_id]).to include("を入力してください")
    end

    it "phone_numberが空だと登録されない" do
      user = build(:user, phone_number: nil)
      user.valid?
      expect(user.errors[:phone_number]).to include("を入力してください")
    end

    it "phone_numberが11文字だと登録できる" do
      user = build(:user, phone_number: "00000000000")
      user.valid?
      expect(user).to be_valid
    end

    it "phone_numberが10文字だと登録できる" do
      user = build(:user, phone_number: "0000000000")
      user.valid?
      expect(user).to be_valid
    end

    it "phone_numberが9文字だと登録されない" do
      user = build(:user, phone_number: "000000000")
      user.valid?
      expect(user.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberが12文字だと登録されない" do
      user = build(:user, phone_number: "000000000000")
      user.valid?
      expect(user.errors[:phone_number]).to include("は不正な値です")
    end

    it "phone_numberが数字以外だと登録されない" do
      user = build(:user, phone_number: "aaaaaaaaaa")
      user.valid?
      expect(user.errors[:phone_number]).to include("は不正な値です")
    end

    it "imageが空でも登録できる" do
      user = build(:user, image: nil)
      user.valid?
      expect(user).to be_valid
    end

    it "pointが空でも登録できる" do
      user = build(:user, point: nil)
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが7文字以上だと登録できる" do
      user = build(:user, password: "0000000")
      user.valid?
      expect(user).to be_valid
    end

    it "passwordが6文字以下だと登録されない" do
      user = build(:user, password: "000000")
      user.valid?
      expect(user.errors[:password]).to include("は7文字以上で入力してください")
    end
  end
end