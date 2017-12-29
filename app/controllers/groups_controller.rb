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
    @group.update(update_params)

  end

  def search
    @users = User.where('name LIKE(?)',"%#{params[:keyword]}%")
    respond_to do |format|
      format.html
      format.json {render 'index',json: @users }#json形式のデータを受け取ったら、@usersをデータとして返す そしてindexをrenderで表示する
    end
  end
  # 文字が入力される
  # ↓
  # jsで読み取る
  # ↓
  # コントローラーにjson形式でajax通信でデータを渡す
  # ↓
  # そのデータを元に、like句を使って検索
  # ↓
  # 検索結果をjsに返す
  # ↓
  # 受け取ったデータをappendで表示する

  private
  def group_params
    params.require(:group).permit(:name,user_ids: [])
  end

  def update_params
    params.require(:user).permit(:id,:name)
  end
end
