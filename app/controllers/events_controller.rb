class EventsController < ApplicationController
  before_filter :set_headers
  skip_before_action :verify_authenticity_token

  def show
    @app = App.find(params[:app_id])
    @event = Event.find(params[:id])
  end

  def new
    @app = App.find(params[:app_id])
    @event = Event.new
  end

  def edit
    @app = App.find(params[:topic_id])
    @event = Event.find(params[:id])
  end

  def create
    @app = App.find(params[:app_id])
    @event = current_user.events.new(event_params)
    @event.app = @app
    @event.ip_address = request.env["REMOTE_HOST"]

    if @event.save
      redirect_to @app, notice: 'Event was successfully created.'
    else
      flash[:error] = "Event was not created. Please try again."
      render :new
    end
  end

  def update
    @app = App.find(params[:app_id])
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to [@app, @event], notice: "Event was successfully updated."
    else
      flash[:error] = "Event was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @app = App.find(params[:app_id])
    @event = Event.find(params[:id])

    if @event.destroy
      redirect_to events_path, notice: "Event was destroyed."
    else
      flash[:error] = "Event was not destroyed. Please try again."
      render :show
    end
  end

  private

  def set_headers
    headers['Access-Control-Allow-Origin']: '*'
    headers['Access-Control-Allow-Methods']: 'POST, GET, OPTIONS'
    headers['Access-Control-Allow-Headers']: 'Content-Type'
    headers['Access-Control-Max-Age']: '1728000'
  end

  def event_params
    params.require(:event).permit(:title, :ip_address, :web_property_id)
  end
end
