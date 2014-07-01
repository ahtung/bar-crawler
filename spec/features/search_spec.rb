require 'rails_helper'

describe 'Search Feature' do
  
  context 'as a User' do
    let!(:user) { FactoryGirl.create(:user) }
    
    before :each do
      login_as(user)
    end
    
    it 'I should be find the shortest walking path between two points'
  end
end