class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def search
    path = Path.create(
      start_address: params[:start_addres],
      end_address: params[:end_address]
    )
    redirect_to pages_result_path(id: path.id)
  end
  
  def result
    @path = Path.find(params[:id])    
  end
end
