class PlacesController < ApplicationController

  def index
    @places = Place.all
  end

  def show
    if User.find_by({ "id" => session["user_id"] }) == nil
      flash["notice"] = "You must log in to view and create posts!"
    end
    @place = Place.find_by({ "id" => params["id"] })
    @entries = Entry.where({ "place_id" => @place["id"], "user_id" => session["user_id"] })
  end

  def new
    # might not actually need this piece below
    if User.find_by({ "id" => session["user_id"] }) == nil
      flash["notice"] = "You must log in to view!"
      redirect_to "/login"
      return
    end
  end

  def create
    @place = Place.new
    @place["name"] = params["name"]
    @place.save
    redirect_to "/places"
  end

end
