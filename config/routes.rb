Tap::Application.routes.draw do
  
  # web application routes 
  root :to => "home#index"

  #devise routes for authenticating users
  devise_for :users, :controllers => { :registrations => "registrations" }
  # general routes for managing users
  resources :users
  # a profile route so users can see their profile
  match "profile" => "users#show"

  # routes for static pages - content controller - just add view for action name  
  get 'content/:action' => 'content'
  get 'content/press-releases/2011-03-12' => "content#press-release1"
  get 'content/career-opportunities/:action' => 'content'
  
  #event routes
  match "/events/:id/checkin" => "events#checkin", :as => 'event_checkin'
  match "/events/:id/checkout" => "events#checkout", :as => 'event_checkout'
  get "/events/new_wizard" => "events#new_wizard", :as => 'wizard_new_event'
  post "/events/place_list" => "events#place_list"
  resources :events

  #place routes
  match "/places/checkin/:id" => "places#checkin", :as => 'checkin'
  match "/places/checkout" => "places#checkout", :as => 'checkout'
  match "/places/search" => "places#search", :as => 'search_places'
  match "/places/searchresults" => "places#searchresults"
  get "/places/quick_add" => "places#quickadd", :as => 'quick_add_place'
  resources :places

  # Route for documenting the API 
  get "/api" => "api#index"

  # API routes
  scope "/api/v11", :format => :json do
    root :to => "api#v11", :as => 'v11_documentation', :format => :html
    # For now all of these are posts with an email and password. If we had time we should upgrade to using basic authentication and then making some of these gets and other posts based on whether they change the state of the app
    match "/login" => "api#login" # Log in - this is really just a hook for down the line if/when we move to basic auth. Right now, you can call login, but all it really does is confirm whether or not the email and password are valid
    match "/places" => "api#places" # Get a list of places near a latlng
    match "/place/:id" => "api#placeshow" # Get info on a place
    match "/placecreate" => "api#placecreate" # Add a new place
    match "/events" => "api#events" # Get a list of events near a latlng
    match "/event/:id" => "api#eventshow" # Get info on an event
    match "/eventcreate" => "api#eventcreate" # Add a new event
    match "/place/:id/checkin" => "api#placecheckin" # Check in to a place
    match "/place/:id/checkout" => "api#placecheckout" # Check out of a place
    match "/place/:id/matches" => "api#placematches" # Get matches for a given place
    match "/event/:id/checkin" => "api#eventcheckin" # Check in to an event
    match "/event/:id/checkout" => "api#eventcheckout" # Check out of an event
    match "/event/:id/matches" => "api#eventmatches" # Get matches for a given event
    
    # Match routes
    match "/match/:id" => "api#match" # Get info on a specific user match 

    # Places/events
    match "/checkins" => "api#places_events" # Get a list of places and events near a lat/lng

  end
  
end
