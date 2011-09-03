class ApiController < ApplicationController
  before_filter :validate_user
  skip_before_filter :validate_user, :only => [:index, :v11]
  layout false
  
  # Filter to validate users
  def validate_user
    @user = User.find_by_email(params[:email])
    if !@user 
      render 'failure', :locals => {:message => 'User not found', :details => "User: #{params[:email]}"}
    end
  end
  
  # New, working methods
  def login
  end

  def places_events
    @events = Event.near(params[:lat], params[:lng])
    @places = Place.near(params[:lat], params[:lng])
    render :json => { :places => @places.as_json(:methods => [:short_name, :short_address, :distance_away]), :events => @events.as_json(:methods => [:short_name, :pretty_starts_at, :pretty_ends_at, :short_address, :distance_away, :logo_url], :include => [:place]) }
  end

  def places
    @places = Place.near(params[:lat], params[:lng])
    render :json => @places
  end

  def placeshow
    @place = Place.find(params[:id]) rescue nil
    if @place
      render :json => {:place => @place.as_json(:methods => [:short_name, :short_address]), :events => @place.events.as_json(:methods => [:short_name, :pretty_starts_at, :pretty_ends_at, :short_address])}
    else 
      render 'failure', :locals => {:message => 'Place not found', :details => "Place: #{params[:id]}"}
    end
  end
  
  def placecreate
    @place = Place.new(:name => params[:name], :category => params[:category], :lat => params[:lat], :lng => params[:lng])
    if @place.save
      render :json => @place
    else
      render 'failure', :locals => {:message => 'Error creating place', :details => ""}   
    end
  end

  def placecheckin
    @place = Place.find(params[:id]) rescue nil
    if @place
      @place.checkin(@user)
      render 'checkin_place'
    else 
      render 'failure', :locals => {:message => 'Place not found', :details => "Place ID: #{params[:id]}"}
    end
  end
  
  def placematches
    @place = Place.find(params[:id]) rescue nil
    if @place
      @matches = @place.matches(@user)
      render 'matches'
    else 
      render 'failure', :locals => {:message => 'Place not found', :details => "Place ID: #{params[:id]}"}
    end
  end

  def placecheckout
    @place = Place.find(params[:id]) rescue nil
    if @place
      @place.checkout(@user)
      render 'success', :locals => {:message => 'Checkout successful', :details => "User: #{@user.email}"}
    else 
      render 'failure', :locals => {:message => 'Place not found', :details => "Place ID: #{params[:id]}"}
    end
  end


  def events
    @events = Event.near(params[:lat], params[:lng])
    render :json => @events.as_json(:methods => [:short_name, :pretty_starts_at, :pretty_ends_at, :short_address])
  end

  def eventshow
    @event = Event.find(params[:id]) rescue nil
    if @event
      render :json => @event.as_json(:methods => [:short_name, :pretty_starts_at, :pretty_ends_at, :short_address, :logo_url])
    else 
      render 'failure', :locals => {:message => 'Event not found', :details => "Event: #{params[:id]}"}
    end
  end

  def eventcreate
    if params[:place_id]
      @place = Place.find(params[:place_id]);
      if !@place 
        @place = Place.new(:name => params[:name], :lat => params[:lat], :lng => params[:lng])
        @place.save
      end
    else 
      @place = Place.new(:name => params[:name], :lat => params[:lat], :lng => params[:lng])
      @place.save
    end
    
    @event = Event.new(:name => params[:name], :lat => params[:lat], :lng => params[:lng], :description => params[:description], :producer_name => params[:producer_name], :place_id => params[:place_id], :category => params[:category], :start => params[:start_time], :end => params[:end_time], :industry => params[:industry])
    
    @place.events << @event
    logger.debug("About to save!")
    logger.debug(@place.inspect)
    logger.debug(@event.inspect)
    
    if @event.save
      logger.debug("Saved Event Successfully")
      render :json => @event
    else
      logger.debug("Failed to Save Event")
      render 'failure', :locals => {:message => 'Error creating event', :details => ""}   
    end
  end

  def eventmatches
    @event = Event.find(params[:id]) rescue nil
    if @event
      @matches = @event.matches(@user)
      render 'matches'
    else 
      render 'failure', :locals => {:message => 'Event not found', :details => "Event ID: #{params[:id]}"}
    end
  end


  def eventcheckin
    @event = Event.find(params[:id]) rescue nil
    if @event
      @event.checkin(@user)
      render 'checkin_event'
    else 
      render 'failure', :locals => {:message => 'Event not found', :details => "Event ID: #{params[:id]}"}
    end
  end

  def eventcheckout
    @event = Event.find(params[:id]) rescue nil
    if @event
      @event.checkout(@user)
      render 'success', :locals => {:message => 'Checkout successful', :details => "User: #{@user.email}"}
    else 
      render 'failure', :locals => {:message => 'Event not found', :details => "Event ID: #{params[:id]}"}
    end
  end

  # Old methods to convert/test
  
  def matches
    @user = User.find_by_email(params[:email])
    if @user
      @place = Place.get(params[:id])
      if @place
        @matches = @place.matches(@user)
        render 'matches'
      else 
        render 'failure', :locals => {:message => 'Place not found', :details => "Place ID: #{params[:id]}"}
      end
    else
      render 'failure', :locals => {:message => 'User not found', :details => "User: #{params[:email]}"}
    end
  end

  def match
    @match = User.find(params[:id])
    render 'match'
  end
  
end
