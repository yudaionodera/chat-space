class SessionsController < Devise::SessionsController
  def destroy  #ログアクト
    super
    session[:keep_signed_out] = true
  end
end
