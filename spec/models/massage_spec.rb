require 'rails_helper'

describe Message do
  describe '#create' do
    #メッセージと写真があれば保存できる
    it "is valid with a message,image" do
      message = build(:message)
      expect(message).to be_valid
    end

    # #画像があれば保存できること
    # it "is valid with a image" do
    #   message = build(:message)
    #   # message.valid?
    #   expect(message).to be_valid
    # end

    #ボディと画像があれば保存できる
    it "is valid with a body,image" do
      message = build(:message)
      expect(message).to be_valid
    end

    #ボディも画像もなかれば保存できない
    it "is invalid without a body,image" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:text_or_image]).to include("を入力してください")
    end
    # || expect(user.errors[:image]).to include("can't be blank")

    #group_idがないと保存できない
    it "is invalid without a group_id" do
      message = build(:message, group_id: "")
      message.valid?
      expect(message.errors[:group_id]).to include("を入力してください")
    end

    #user_idがないと保存できない。
    it "is invalid without a user_id" do
      message = build(:message, user_id: "")
      message.valid?
      expect(message.errors[:user_id]).to include("を入力してください")
    end
  end
end
