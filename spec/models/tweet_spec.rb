require 'rails_helper'

RSpec.describe Tweet, type: :model do
  before do
    @tweet = FactoryBot.build(:tweet)
  end

  describe "ツイートの保存" do
    context "ツイートが投稿できる場合" do
      it "全ての値が正しく入力されていればツイートが投稿できること" do
        expect(@tweet).to be_valid
      end
    end

    context "ツイートが投稿できない場合" do
      it "タイトルが空では投稿できない" do
        @tweet.title = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Title can't be blank"
      end

      it "コンテンツが空では投稿できない" do
        @tweet.content = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Content can't be blank"
      end

      it "Urlが空では投稿できない" do
        @tweet.url = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include "Url can't be blank"
      end

      it "投稿に画像を1枚つけることが必須であること" do
        @tweet.image = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include{"Image can't be blank"}
      end

      it 'ユーザーが紐付いていなければ投稿できない' do
        @tweet.user = nil
        @tweet.valid?
        expect(@tweet.errors.full_messages).to include('User must exist')
      end
    end
  end
end
