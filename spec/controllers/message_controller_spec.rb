require 'rails_helper'
require 'devise'

describe MessagesController, type: :controller do
  let(:user){create(:user)}
  let(:group){create(:group)}

  describe 'GET #index' do
     context 'with user login' do
        before  do
          login_user user # controller_macros.rb内のlogin_userメソッドを呼び出し
        end
        it "assigns the requested message to @groups" do
          groups = create_list(:group, 3)
          get :index
          expect(assigns(:groups)).to match(groups)
        end

        it "assigns the requested message to @group" do
          #group = FactoryGirl.create(:group)
          get :index id: #group#id: group.uesr_id
          expect(assaigns(:group)).to eq group
        end

        it "assigns the requested message to @messages" do
          messages = create_list(:message, 3)
          get :index
          expect(assigns(:messages)).to match(messages)
        end

        it "assigns the requested @message" do
          message = FactoryGirl.create(:message)
          get :index #id: message_id
          expect(assaigns(:message)).to be_a_new(Message)
        end

        it "it renders the :index template" do
          get :index
          expect(response).to render_template :index
        end
      context 'by no login user' do
        before do
            patch :create, permalink: user.permalink, user: attributes_for(:user, name: '  ')
          end
        it "it renders the :devise/session/new template" do
          expect{
            patch :create, permalink: 'hogehoge' , user: attributes_for(:user)
          }.to raise_exception(ActiveRecord::RecordNotFound) #ここどうかけばいいんだ
        end
      end
    end
  end

  describe 'POST #create'
    context 'uesr is logind and succsessed save the message' do
      before do
        login_user user
      end
      it "has saved message in the database" do
        message = FactoryGirl.create(:message)
        get :index #id: message
        expect(assaigns(:message)).to eq message
      end
    context  'uesr is logind and faild save the message' do
      it "renders the :index template" do
        message = FactoryGirl.create(:message, body: "",image: "" )
        get :index #id: message
        #ほげほげ。失敗した時の反応
        # 失敗した時の記入の仕方どうやるんだろう。
      end

      it "it renders the root template after message create" do
        message = FactoryGirl.create(:message)
        get:index  #id: message.id
        expect(response).to render_template :root
      end
    end
    context 'by no login user' do
      before do
          patch :create, permalink: user.permalink, user: attributes_for(:user, name: '  ')
        end
      it "it renders the :devise/session/new template" do
        expect{
          patch :create, permalink: 'hogehoge' , user: attributes_for(:user)
        }.to raise_exception(ActiveRecord::RecordNotFound)#ここどうかけばいいんだ
    end
  end
end
end

#before do と contextmのp
