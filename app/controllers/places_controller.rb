class PlacesController < ApplicationController

  def checkin
    @place = Place.find(params[:id])
    @place.checkin(current_user)
    flash[:notice] = "Congratulations #{@current_user.name}. You successfully checked in to #{@place.name}. There are #{@place.users(true).count - 1} other users there."
    redirect_to(place_path(@place))
  end

  def checkout
    @place = Place.find(params[:id])
    @place.checkout(current_user)
    flash[:notice] = "Congratulations #{@current_user.name}. You successfully checked out of #{@place.name}. There are #{@place.users(true).count} other users there."
    redirect_to(place_path(@place))
  end

  # POST /places
  def create
    @place = Place.new(params[:place])
    @place.geocode
    if @place.save
      redirect_to(@place, :notice => "Place was successfully created.")
    else
      render :action => "new"
    end
  end

  # GET /places/new
  def new
    @place = Place.new
  end

  def quickadd
    @place = Place.new(params[:place])
  #  @place.address = params['address']
  end

  def search
  end

  def searchresults
    @location = Location.new(params[:address], '', params[:city], params[:state], params[:zip])
    @places = Place.near(@location.lat, @location.lng)
    @events = Event.near(@location.lat, @location.lng)
  end

  def show
    @place = Place.find(params[:id])    
  end

  # Scaffolded code to review
  

  # GET /places/1/edit
  def edit
    @place = Place.find(params[:id])
  end

  # PUT /places/1
  # PUT /places/1.xml
  def update
    @place = Place.find(params[:id])

    respond_to do |format|
      if @place.update_attributes(params[:place])
        format.html { redirect_to(@place, :notice => 'Place was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @place.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /places/1
  # DELETE /places/1.xml
  def destroy
    @place = Place.find(params[:id])
    @place.destroy

    respond_to do |format|
      format.html { redirect_to(places_url) }
      format.xml  { head :ok }
    end
  end
end
