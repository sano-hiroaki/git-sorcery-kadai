class UserSessionsController < ApplicationController

  def new; end

  def create
    @user = User.find_by(email: session_params[:email])
    
    if @user&.authenticate(session_params[:password])
      session[:user_id] = user.id
      flash[:success] = 'Login successful.'
      redirect_to root_url 
    else
      flash[:danger] = 'Login failed.'
      render :new
    end
  end

  def destroy
    reset_session
    flash[:success] = 'Loginout.'
    redirect_to root_url 
  end


  private

  def session_params
    params.permit(:email, :password)
  end

end
