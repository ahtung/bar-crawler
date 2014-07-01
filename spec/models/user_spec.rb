require 'rails_helper'

RSpec.describe User, :type => :model do
  
  let!(:user){ FactoryGirl.create(:user) }
  
  it 'should have many paths' do
    expect(user.paths.count).to be > 0  
  end
end
