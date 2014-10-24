class AppsController < ApplicationController
  before_filter :authenticate_user!

  def index
    @apps = App.all
  end

  def new
    @app = App.new
  end

  def show
    @app = App.find(params[:id])
  end

  def edit
    @app = App.find(params[:id])
  end

  def create
    @app = current_user.apps.new(app_params)

    if @app.save
      flash[:notice] = "App was saved."
      redirect_to apps_path
    else
      flash[:error] = "App was not saved. Please try again."
      render :new
    end
  end

  def update
    @app = App.find(params[:id])

    if @app.update_attributes(app_params)
      flash[:notice] = "App was updated."
      redirect_to @app
    else
      flash[:notice] = "App was not updated. Please try again."
      render :edit
    end
  end

  def destroy
    @app = App.find(params[:id])

    if @app.destroy
      flash[:notice] = "App was deleted."
      redirect_to apps_path
    else
      flash[:error] = "App was not deleted. Please try again."
      render :edit
    end
  end


  private

  def app_params
    params.require(:app).permit(:name)
  end
end
