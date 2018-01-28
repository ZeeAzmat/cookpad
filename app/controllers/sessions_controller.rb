class SessionsController < ApplicationController
  
  def create
  	@user = User.find_or_create_from_auth_hash(env["omniauth.auth"])
  	if @user.persisted?
	  	session[:user_id] = @user.id
	  	redirect_to :profile
	  else
	  	session[:user_id] = nil
	  	redirect_to :root
		end
  end

  def destroy
  	session[:user_id] = nil
  	redirect_to root_path
  end
end
