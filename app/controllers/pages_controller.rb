# PagesController
class PagesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_path, only: [:result]

  def index
  end

  def search
    path = Path.create(start_address: params[:start_address], end_address: params[:end_address])
    redirect_to pages_result_path(id: path.id)
  end

  def result
  end

  private
    def set_path
      @path = Path.find(params[:id])
    end
end
