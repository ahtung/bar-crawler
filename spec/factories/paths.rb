# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :path do
    start_address "Buijs Ballotstraat 106, Den Haag"
    end_address "Fahreheitstraat 102, Den Haag"
    start_lat 1.5
    start_long 1.5
    end_lat 1.5
    end_long 1.5
    bars { FactoryGirl.create_list(:bar, 5) }
  end
end
