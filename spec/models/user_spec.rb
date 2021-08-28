require 'rails_helper'

describe User do
  describe '#create' do


    # 入力されている場合のテスト
    it "全ての項目の入力が存在すれば登録できること" do
      user = FactoryBot.create(:user)
      expect(user).to be_valid
    end


    # nul:false, presence: true のテスト
    it "nameがない場合は登録できないこと" do
      user = FactoryBot.build(:user, name: nil)
      user.valid?
      expect(user.errors[:name]).to include("を入力してください")
    end

    it "emailがない場合は登録できないこと" do
      user = FactoryBot.build(:user, email: nil)
      user.valid?
      expect(user.errors[:email]).to include("を入力してください")
    end

    it "passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user, password: nil)
      user.valid?
      expect(user.errors[:password]).to include("を入力してください")
    end

    it "encrypted_passwordがない場合は登録できないこと" do
      user = FactoryBot.build(:user, encrypted_password: nil)
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください")
    end


    # email 一意性制約のテスト
    it "重複したemailが存在する場合登録できないこと" do
      user = FactoryBot.create(:user)
      another_user = FactoryBot.build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include("はすでに存在します")
    end



    # 確認ようパスワードが必要であるテスト
    it "passwordとencrypted_passwordがない場合は登録できないこと" do

      user = FactoryBot.build(:user, encrypted_password: "")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("を入力してください", "は6文字以上で入力してください")
    end


    it "passwordとpassword_confirmationが一致しない場合は登録できないこと" do
      user= build(:user, password_confirmation: "123457")
      user.valid?
      expect(user.errors[:password_confirmation]).to include("とパスワードの入力が一致しません")
    end



    # パスワードの文字数テスト
    it "passwordが6文字以上であれば登録できること" do
      user = FactoryBot.build(:user, password: "123456", encrypted_password: "123456")
      expect(user).to be_valid
    end

    it "passwordが6文字以下であれば登録できないこと" do
      user = FactoryBot.build(:user, password: "12345", encrypted_password: "12345")
      user.valid?
      expect(user.errors[:encrypted_password]).to include("は6文字以上で入力してください")
    end

  end
end