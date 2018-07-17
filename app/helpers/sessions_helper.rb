module SessionsHelper

  #渡されたユーザーでログインする
  def log_in(user)
    flash[:success] = "おかえりなさい。#{user.name}さん。"
    session[:user_id] = user.id
  end

  #現在ログイン中のユーザーを返す
  def current_user
    @current_user ||= User.find_by(id: session[:user_id])
  end

  #ユーザーがログインしていればtrueそうでなければfalseを返す
  def logged_in?
    !current_user.nil?
  end

  #ログアウト
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
