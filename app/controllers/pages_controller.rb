class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def search
    start_lat, start_long = calculate_lat_long(params[:start_point])
    end_lat, end_long = calculate_lat_long(params[:end_point])
    Path.create(
      start_lat: start_lat,
      start_long: start_long,
      end_lat: end_lat,
      end_long: end_long
    )
    redirect_to pages_result_path
  end
  
  def result
    
  end
  
  private
  
    def calculate_lat_long(address)
      return [1.0, 1.0]
    end
end
