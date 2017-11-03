class MessagesController < ApplicationController
	def index
			@groups = current_user.groups
			@group = Group.find(params[:group_id])
			@messages = @group.messages
			@message = Message.new

	end

	def new
		@message = Message.new
	end

	def create
		@message = current_user.messages.new(message_params)
		if @message.save
			redirect_to root_path, notice: "メッセージを保存しました"
			#メッセージ保存成功
		else
			# メッセージ失敗
			flash.now[:alert] = "メッセージ保存に失敗しました"
			render :index
		end
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
