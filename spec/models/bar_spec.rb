require 'rails_helper'

RSpec.describe Bar, :type => :model do
  
  let!(:bar) { FactoryGirl.create(:bar) }
  
  it 'should have a name' do
    expect(bar.name).not_to be_nil
  end
end
