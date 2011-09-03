class EventsController < ApplicationController

  # GET /events/new
  def new
    @event = Event.new
  end

  def new_wizard
    @event = Event.new
  end

  # POST /events
  def create
    @event = Event.new(params[:event])
    @place = @event.place
    @event.lat = @place.lat
    @event.lng = @place.lng
    @event.creator = current_user
    if @event.save
     redirect_to(place_path(@event.place), :notice => 'Event was successfully created.')
    else
       render :action => "new" 
    end
  end

  # GET /events/1
  def show
    @event = Event.find(params[:id])
    @place = @event.place
  end

  def checkin
    @event = Event.find(params[:id])
    @event.checkin(current_user)
    flash[:notice] = "Congratulations #{@current_user.name}. You successfully checked in to #{@event.name}. There are #{@event.users(true).count - 1} other users there."
    redirect_to(event_path(@event))
  end

  def checkout
    @event = Event.find(params[:id])
    @event.checkout(current_user)
    flash[:notice] = "Congratulations #{@current_user.name}. You successfully checked out of #{@event.name}. There are #{@event.users(true).count} other users there."
    redirect_to(event_path(@event))
  end

  def place_list
    @location = Location.new(params[:address], params[:address_2], params[:city], params[:state], params[:zip])
    @places = Place.near(@location.lat, @location.lng)
  end

# Scaffolded methods

  # GET /events
  # GET /events.xml
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @events }
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # PUT /events/1
  # PUT /events/1.xml
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to(@event, :notice => 'Event was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @event.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.xml
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to(events_url) }
      format.xml  { head :ok }
    end
  end
end
