class Path < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :bars
  
  geocoded_by :start_address, latitude: :start_lat, longitude: :start_long
  geocoded_by :end_address, latitude: :end_lat, longitude: :end_long
  
  after_validation :geocode
  
  def length
    1
  end
end
