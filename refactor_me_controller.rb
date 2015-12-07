class SessionsController < ApplicationController
  def signin
    @user = User.find_by(email: params[:email])

    if @user.authenticate(params[:password])
      self.current_user = @user
      redirect_to root_path
    else
      flash.now[:alert] = "Login failed."
      render :new
    end
  end
end

class User < ActiveRecord::Base
  has_secure_password validations: false
end
