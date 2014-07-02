class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_path, only: [:result]
  
  def index
  end
  
  def search
    path = Path.create(path_params)
    redirect_to pages_result_path(id: path.id)
  end
  
  def result
  end
  
  private
    def set_path
      @path = Path.find(params[:id])
    end

    def path_params
      params.permit(:start_address, :end_address)
    end
end
