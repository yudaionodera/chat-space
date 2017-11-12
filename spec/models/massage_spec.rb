require 'rails_helper'

describe Message do
  descrive '#create' do
    #メッセージがあれば保存できる
    it "is valid with a message" do
      message = build(:message,body: "あああああ")
      user.valid?
      expect(user).to be_valid
    end

    #画像があれば保存できること
    it "is valid with a image" do
      message = build(:message,image: "www")
      user.valid?
      expect(user).to be_valid
    end

    #ボディと画像があれば保存できる
    it "is valid with a body,image" do
      message = build(:message)
      expect(message).to be_valid
    end

    #ボディも画像もなかれば保存できない
    it "is invalid without a body,image" do
      message = build(:message, body: "", image: "")
      expect(user.errors[:body]).to include("can't be blank") || expect(user.errors[:image]).to include("can't be blank")
    end

    #group_idがないと保存できない
    it "is invalid without a group_id" do
      message = build(:message, group_id: "")
      expect(user.errors[:group_id]).to include("can't be blank")

    end

    #user_idがないと保存できない。
    it "is invalid without a user_id" do
      message = build(:message, uesr_id: "")
      expect(user.errors[:user_id]).to include("can't be blank")

    end
