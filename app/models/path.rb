class Path < ActiveRecord::Base

  has_and_belongs_to_many :bars
  
  def length
    1
  end
end
