class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
    @messages = Message.all
  end

  def show
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render :index
    end
  end

  def edit
    @group = Group.find(params[:id])
    @users = @group.users
  end

  def update
    @group =Group.find(params[:id])
    @users = @group.users
    if @group.update(update_params)
      redirect_to root_path, notice: "グループを更新しました"
    else
      redirect_to edit_group_path(@group.id),notice: "グループを更新に失敗しました"
    end
  end

  def search
    @users = User.where('name LIKE(?)',"%#{params[:keyword]}%")
    # @group = Group.find(params[:id])
    respond_to do |format|
      format.html
      format.json {render 'search.json.jbuilder',json: @users }#json形式のデータを受け取ったら、@usersをデータとして返す
      #
    end
  end

  private
  def group_params
    params.require(:group).permit(:name,user_ids: [])
  end

  def update_params
    params.require(:group).permit(user_ids: [])
  end
end
