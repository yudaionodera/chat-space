class MessagesController < ApplicationController
	def index
			@groups = current_user.groups
			@group = Group.find(params[:group_id])
			@messages = @group.messages
			@message = Message.new
			@users = @group.users
			respond_to do |format|
				format.html
				format.json{ @new_message = Message.where('id > ?',params[:message][:id])}
			end
	end

	def new
		@message = Message.new
	end

	def create
		@message = current_user.messages.new(message_params)
		respond_to do |format|
			if 	@message.save
				format.html{ redirect_to group_messages_path(params[:group_id])}
				format.json
			else
				format.html{redirect_to group_messages_path(params[:group_id])}
				format.json
			end
		end
		# if @message.save
		# 	redirect_to root_path, notice: "メッセージを保存しました"
		# 	#メッセージ保存成功
		# else
		# 	# メッセージ失敗
		# 	flash.now[:alert] = "メッセージ保存に失敗しました"
		# 	render :index
		# end
	end

	def edit
	end

	def update
	end

	private
	def message_params
    params.require(:message).permit(:body,:image).merge(group_id: params[:group_id])
  end

end
