class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user
      redirect_to user
    else
      flash.now[:danger] = "入力されたユーザー名かパスワードに誤りがあります。"
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
    flash[:success] = "ログアウトしました。"
  end

end
