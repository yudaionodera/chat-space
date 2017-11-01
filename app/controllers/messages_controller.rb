class MessagesController < ApplicationController
	def index
			@group = current_user.groups
	end

	def new
	end

	def create
		@messege = Message.new(message_params)
		if @messege.save
			redirect_to root_path, notice: "メッセージを保存しました"
			#メッセージ保存成功
		else
			# メッセージ失敗
			flash.now[:alert] = "メッセージ保存に失敗しました"
			render :index
		end
		binding.pry
	end

	def edit
	end

	def update
	end

	private
	def message_params
    params.require(:message).permit(:body,:image).merge(user_id: current_user.id)
  end

end
