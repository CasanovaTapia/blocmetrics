class EventsController < ApplicationController
  before_filter :set_headers
  skip_before_filter :verify_authenticity_token, only: [:create]
  before_filter :authenticate_user!
  before_filter :set_current_user

  def index
    @events = Event.where(user_key: current_user.unique_key)
  end

  def create
    puts "TRACKED PARAMS HERE: #{params}"

    @event = Event.new(event_params)
    @event.ip_address = request.env["REMOTE_HOST"]

    respond_to do |format|
      if @event.save!
        format.json { render :status => 200,
          :json => "Success",
          :location => events_path }
      else
        format.json { render :status => 401,
          :json => @event.errors }
      end
    end
  end

  private

  def set_headers
    headers['Access-Control-Allow-Origin'] = '*'
    headers['Access-Control-Allow-Methods'] = 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers'] = 'Content-Type'
    headers['Access-Control-Request-Method'] = '*'
    headers['Access-Control-Max-Age'] = '1728000'
  end

  def event_params
    params.permit(:name, :location, :property_1, :property_2, :user_key)
  end
end
