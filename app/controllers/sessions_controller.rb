class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by({ "email" => params["email"] })

    if @user != nil
      if BCrypt::Passwod.new(@user["password"]) == params["password"]
        session["user_id"] = @user["id"]
        flash["notice"] = "Welcome #{@user["first_name"]}!"
        redirect_to "/places"
      else
        flash["notice"] = "Incorrect attempt; please try again."
        redirect_to "/login"
      end
        flash["notice"] = "Incorrect attempt; please try again."
        redirect_to "/login"
    end
  end

  def destroy
    flash["notice"] = "Goodbye! You are now logged out."
    session["user_id"] = nil
    redirect_to "/login"
  end
end
  