class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @message = Message.new
  end

  def show
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    Message.create(message_params)
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def update
    @grouop =Group.find(params[:id])
    @users = @group.users
    @group.update(update_params)
  end

  private
  def group_params
    params.require(:group).permit(:name,user_ids: [])
  end

  def update_params
    params.require(:user).permit(:id,:name)
  end

  def message_new
    params.require(:message),permit(:body,:image)
  end

end
