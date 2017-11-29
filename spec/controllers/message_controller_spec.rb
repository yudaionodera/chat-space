require 'rails_helper'
require 'devise'

describe MessagesController, type: :controller do
  let(:user){FactoryGirl.create(:user)}
  let(:group){FactoryGirl.create(:group)}
  let(:groups) {create_list(:group, 4)}
  let(:message){FactoryGirl.create(:message)}
  let(:messages){create_list(:message, 3)}
  before do
    sign_in user
  end
  #letの説明
  #https://qiita.com/jnchito/items/42193d066bd61c740612#%E9%81%85%E5%BB%B6%E8%A9%95%E4%BE%A1%E3%81%95%E3%82%8C%E3%82%8B-let-%E3%81%A8%E4%BA%8B%E5%89%8D%E3%81%AB%E5%AE%9F%E8%A1%8C%E3%81%95%E3%82%8C%E3%82%8B-let
  #アソシエーションが関係する際のテストコー
  #https://qiita.com/kojiro3/items/b0957813695ca61fa3aa
  describe 'GET#index' do
     context 'with user login' do
        before  do
          login_user user # controller_macros.rb内のlogin_userメソッドを呼び出し
          get :index, group_id: group
        end
        it "assigns the requested message to @groups" do
          expect(assigns(:groups)).to match(groups)
        end
        it "assigns the requested message to @group" do
          expect(assigns(:group)).to eq group
        end
        it "assigns the requested message to @messages" do
          expect(assigns(:messages)).to match(messages)
        end

        it "assigns the requested @message" do
          expect(assigns(:message)).to be_a_new(Message)
        end
        it "it renders the :index template" do
          expect(response).to render_template :index
        end
      context 'by no login user' do
        before do
          #  patch :create, permalink: user.permalink, user: attributes_for(:user, name:  "")
          end
        it "it renders the :devise/session/new template" do
          expect(response).to render_template :index
          # expect{
          #   patch :index, permalink: 'hogehoge' , user: attributes_for(:user)
          # }.to raise_exception(ActiveRecord::RecordNotFound) #ここどうかけばいいんだ
        end
      end
    end
  end

  describe 'POST #create' do
    context 'uesr is logind and succsessed save the message' do
      before do
        login_user user
        get :index, group_id: group
      end
      it "has saved message in the database" do
        #expect(assigns(:message)).to eq message
        expect(assigns(:message)).to be_a_new(Message)
      end
    context  'uesr is logind and faild save the message' do
      #メッセージの保存は行われなかったか
      it "renders the :index template" do
      message = build(:message, body: "", image: "")
      message.valid?
      expect(message.errors[:text_or_image]).to include("を入力してください")
      end

      it "it renders the root template after message create" do
        #意図したビューが描画されているか
        expect(response).to render_template :index
      end
    end
  end
    context 'by no login user' do
      before do
          #patch :create, permalink: user.permalink, user: attributes_for(:user, name: nill)

        end
      it "it renders the :devise/session/new template" do
        #意図した画面にリダイレクトできているか
        # expect{
          #post :create, permalink: 'hogehoge' , user: attributes_for(:user)
          #post :create, group_id: group
        # }.to raise_exception(ActiveRecord::RecordNotFound)#ここどうかけばいいんだ
          post :create, group_id: group, message: attributes_for(:message, body: "",image: "",group_id: group.id, user_id: user.id)
        #  expect(response).to redirect_to group_messages_path
          expect(response).to render_template :index
      end
    end
  end
end

#before do と contextmのp
