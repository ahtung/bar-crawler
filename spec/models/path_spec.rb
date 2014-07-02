require 'rails_helper'

RSpec.describe Path, :type => :model do
  
  let!(:path) { FactoryGirl.create(:path) }
  
  it 'should have a length' do
    expect(path.length).to be > 0
  end
  
  it 'should have many bars' do
    expect(path.bars.count).to be > 0
  end
end
