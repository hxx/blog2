class SessionsController < ApplicationController
  def new

  end
  def create
    @user = User.authenticate(params[:login], params[:password])
    if @user
      session[:user_id] = @user.id
      flash[:notice] = "Welcom #{@user.login}"
      redirect_to articles_path
    else
      flash[:notice] = "The login or password is not correct."
      redirect_to new_session_path
    end
  end
end
