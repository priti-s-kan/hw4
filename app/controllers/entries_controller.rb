class EntriesController < ApplicationController

  def new    
    if User.find_by({ "id" => session["user_id"] }) == nil
      flash["notice"] = "You must log in to view!"
      redirect_to "/login"
      return
    end
    @place = Place.find_by({ "id" => params["place_id"] })
  end

  def create
    if User.find_by({ "id" => session["user_id"] }) == nil
      flash["notice"] = "You must log in to view!"
      redirect_to "/login"
      return
    end
    
    @entry = Entry.new
    @entry["title"] = params["title"]
    @entry["description"] = params["description"]
    @entry["occurred_on"] = params["occurred_on"]
    @entry["place_id"] = params["place_id"]
    @entry["user_id"] = session["user_id"]
    @entry.uploaded_image.attach(params["uploaded_image"])
    @entry.save
    redirect_to "/places/#{@entry["place_id"]}"
  end

end
