class GroupsController < ApplicationController
  def show
    @groups = Group.all
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: "グループを作成しました"
    else
      flash.now[:alert] = "グループ作成に失敗しました"
      render :new
    end
  end


  def edit
    @group = Group.find(params[:id])
    @user = @group.user
  end

  def update
  end

  private
  def group_params
    params.require(:group).permit(:name,member_ids: [])
  end
end
