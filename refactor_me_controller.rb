class SessionsController < ApplicationController
  def signin
    @user = User.find_by(email: params[:email])

    if BCrypt::Password.new(@user.password_digest) == params[:password]
      self.current_user = @user
      redirect_to root_path
    else
      flash[:alert] = "Login failed."
      render :new
    end
  end
end
