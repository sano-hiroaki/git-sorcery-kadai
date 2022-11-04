class UserSessionsController < ApplicationController
  def new; end

  def create
    @user = login(params[:email], params[:password])
    if @user
      flash[:success] = 'Login successful.'
      redirect_back_or_to root_path
    else
      flash[:danger] = 'Login failed.'
      render :new
    end
  end
end
