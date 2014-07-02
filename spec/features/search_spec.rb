require 'rails_helper'
require 'pp'
describe 'Search Feature' do
  
  before :all do
    Geocoder.configure(:lookup => :test)

    Geocoder::Lookup::Test.add_stub(
      "Fahreheitstraat 102, Den Haag", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => 'New York, NY, USA',
          'state'        => 'New York',
          'state_code'   => 'NY',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )

    Geocoder::Lookup::Test.add_stub(
      "Buijs Ballotstraat 106, Den Haag", [
        {
          'latitude'     => 40.7143528,
          'longitude'    => -74.0059731,
          'address'      => 'New York, NY, USA',
          'state'        => 'New York',
          'state_code'   => 'NY',
          'country'      => 'United States',
          'country_code' => 'US'
        }
      ]
    )
  end
  
  context 'as a User' do
    let!(:user) { FactoryGirl.create(:user) }
    
    before :each do
      login_as(user)
    end
    
    it 'I should be able to find the lat long of my start point' do
      fill_in 'start_address', with: 'Buijs Ballotstraat 106, Den Haag'
      click_on 'search'
      
      expect(Path.last.start_lat).not_to be_nil
      expect(Path.last.start_long).not_to be_nil
    end
    
    it 'I should be able to find the lat long of my end point' do
      fill_in 'end_address', with: 'Fahreheitstraat 102, Den Haag'
      click_on 'search'
      
      expect(Path.last.end_lat).not_to be_nil
      expect(Path.last.end_long).not_to be_nil
    end
    
    it 'I should create a new path model' do
      fill_in 'start_address', with: 'Buijs Ballotstraat 106, Den Haag'
      fill_in 'end_address', with: 'Fahreheitstraat 102, Den Haag'
      click_on 'search'
      
      expect(Path.count).to eq(6)
    end
    
    it 'I should be able to find the shortest walking path between two points'
  end
end