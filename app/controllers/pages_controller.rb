class PagesController < ApplicationController
  before_action :authenticate_user!
  
  def index
  end
  
  def search
    redirect_to pages_result_path
  end
  
  def result
    
  end
end
