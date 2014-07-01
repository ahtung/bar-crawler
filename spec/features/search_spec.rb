require 'rails_helper'

describe 'Search Feature' do
  
  context 'as a User' do
    let!(:user) { FactoryGirl.create(:user) }
    
    before :each do
      login_as(user)
    end
    
    it 'I should be find the shortest walking path between two points' do
      fill_in 'start_point', with: 'Buijs Ballotstraat 106, Den Haag'
      fill_in 'end_point', with: 'Fahreheitstraat 102, Den Haag'
      click_on 'search'
      
      expect(page).to have_content('Route')
    end
  end
end