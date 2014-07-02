class Path < ActiveRecord::Base

  belongs_to :user
  has_and_belongs_to_many :bars
  
  geocoded_by :start_address, latitude: :start_lat, longitude: :start_long
  geocoded_by :end_address, latitude: :end_lat, longitude: :end_long
  
  before_validation :custom_geocoding

  def custom_geocoding
    start_result = Geocoder.search(self.start_address).first
    end_result = Geocoder.search(self.end_address).first
    self.start_lat = start_result.latitude if start_result
    self.start_long = start_result.longitude if start_result
    self.end_lat = end_result.latitude if end_result
    self.end_long = end_result.longitude if end_result
  end
  
  def length
    1
  end
end
