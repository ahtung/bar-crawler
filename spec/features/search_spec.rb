require 'rails_helper'

describe 'Search Feature' do
  
  context 'as a User' do
    let!(:user) { FactoryGirl.create(:user) }
    
    before :each do
      login_user
    end
    
    it 'I should be find the shortest wlking path between two points' do
      
    end
  end
end