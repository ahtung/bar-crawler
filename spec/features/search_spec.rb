require 'rails_helper'

describe 'Search Feature' do
  
  context 'as a User' do
    let!(:user) { FactoryGirl.create(:user) }
    
    before :each do
      login_as(user)
    end
    
    it 'I should be find the shortest walking path between two points' do
      fill_in 'start_address', with: 'Buijs Ballotstraat 106, Den Haag'
      fill_in 'end_address', with: 'Fahreheitstraat 102, Den Haag'
      click_on 'search'
      
      expect(page).to have_content('Route')
      expect(page).to have_content('Print')
      expect(page).to have_css('#map')
      expect(page).to have_css('.bars')
      expect(Path.count).to eq(6)
      expect(Path.first.start_lat).not_to be_nil
      expect(Path.first.start_long).not_to be_nil
      expect(Path.first.end_lat).not_to be_nil
      expect(Path.first.end_long).not_to be_nil
    end
  end
end