require 'rails_helper'

describe MessageController, type: :controller do
  let(:user){create(:user)}

  describe 'Get #index' do
    context 'ログインしている際'
      it "アクションないで定義しているインスタンス変数があるか" do
      it "該当するビュー(:index)が表示されるか" do
    end
    context 'ログインしていない場合'
      it "意図したビューに(devise/session/new)リダイレクトされるか" do
    end
  end

  describe 'Post #create'
    context 'ログインしているかつ、保存に成功した際'
      it "メッセージの保存はできているか" do
      it "メッセージ作成後、意図したView(:message/index)に遷移するか" do
    end
    context 'ログインしていない場合'
      it "意図したview(devise/session/new)に遷移するか"
    end
  end

end

# メッセージを作成するアクション create

  # ログインしているかつ、保存に成功した場合
  # メッセージの保存はできたのか

  # 意図した画面に遷移しているか

  # ログインしているが、保存に失敗した場合
  # メッセージの保存は行われなかったか

  # 意図したビューが描画されているか

  # ログインしていない場合
  # 意図した画面にリダイレクトできているか
