class UsersController < ApplicationController
  def new
  end

  def show
    @user = User.find_by({ "id" => params["id"] })
  end

  def create
    @user = User.new
    @user["username"] = params["username"]
    @user["email"] = params["email"]
    @user["password"] = BCrypt::Password.create(params["password"])
    @user.save
    flash["notice"] = "Your account has been created; please log in to continue your session."
    redirect_to "/login"
  end
end
