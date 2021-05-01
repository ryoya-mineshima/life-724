require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe "新規登録" do
    context "新規登録ができる時" do
      it "全ての値が正しく入力されていれば新規登録ができること" do
        expect(@user).to be_valid
      end
    end

    context "新規登録ができない時" do
      it "nameが空では登録できない" do
        @user.name = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Name can't be blank"
      end

      it "emailが空では登録できない" do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Email can't be blank"
      end

      it "emailに@がない場合は登録できないこと" do
        @user.email = "aaaaaa"
        @user.valid?
        expect(@user.errors[:email]).to include "is invalid"
      end

      it "重複したemailが存在する場合登録できないこと" do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include "Email has already been taken"
      end

      it "passwordが空では登録できないこと" do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include "Password can't be blank"
      end

      it "passwordが6文字以上で、半角英数字混合であれば登録できること" do
        @user.password = "123abc"
        @user.password_confirmation = "123abc"
        expect(@user).to be_valid
      end

      it "passwordが、半角数字のみでは登録できないこと" do
        @user.password = "123456"
        @user.password_confirmation = "123456"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end

      it "passwordが、全角数字のみでは登録できないこと" do
        @user.password = "１２３４５６"
        @user.password_confirmation = "１２３４５６"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end

      it "passwordが、半角英字のみでは登録できないこと" do
        @user.password = "abcdef"
        @user.password_confirmation = "abcdef"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end

      it "passwordが、全角英字のみでは登録できないこと" do
        @user.password = "ABCDEF"
        @user.password_confirmation = "ABCDEF"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end

      it "passwordが5文字以下であれば登録できないこと" do
        @user.password = "12345"
        @user.password_confirmation = "12345"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation is invalid"
      end

      it "passwordとpassword_confirmationが不一致では登録できないこと" do
        @user.password = "123abc"
        @user.password_confirmation = "123abcd"
        @user.valid?
        expect(@user.errors.full_messages).to include "Password confirmation doesn't match Password"
      end
    end
  end
end
