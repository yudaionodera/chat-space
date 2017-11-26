require 'rails_helper'

describe MessageController, type: :controller do
  let(:user){create(:user)}

  describe 'GET #index' do
    # context 'ログインしている際' do
      before  do
        login_user user
        # controller_macros.rb内のlogin_userメソッドを呼び出し
      end

      it "assigns the requested message to @groups" do
        groups = create_list(:grouo, 3)
        get :index
        expect(assigns(:groups)).to match(groups)
      end

      it "assigns the requested message to @group" do
        group = FactoryGirl.create(:grouo)
        get :index id: grouo
        expect(assaigns(:group)).to eq group
      end

      it "assigns the requested message to @messages" do
        messages = create_list(:message, 3)
        get :index
        expect(assigns(:messages)).to match(messages)
      end

      it "assigns the requested @message" do
      end

      it "it renders the :index template" do
        get :index
        expect(response).to render_template :index
      end
    context 'ログインしていない場合' do
      it "意図したビューに(devise/session/new)リダイレクトされるか" do
      end
    end
  end

  describe 'POST #create'
    context 'ログインしているかつ、保存に成功した際' do
      it "メッセージの保存はできているか" do
        message = FactoryGirl.create(:message)
        get :index id: message
        expect(assaigns(:message)).to eq message
      end
    context  'ログインしているかつ、保存に失敗した際' do
      it "renders the :index template" do
        message = FactoryGirl.create((:message, body: "",image: "" ))
        get :index id: message
        #ほげほげ。失敗した時の反応
        # 失敗した時の記入の仕方どうやるんだろう。
      end

      it "it renders the root template after message create" do
        message = FactoryGirl.create(:message)
        get:index, id: message.id
        expect(response).to render_template :root
      end
    end
    context 'ログインしていない場合' do
      it "it renders the :devise/session/new template" do
        get :devise/session/new
        # ほげほげ
    end
  end
end
