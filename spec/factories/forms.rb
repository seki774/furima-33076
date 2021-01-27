FactoryBot.define do
  factory :form do
    postal_code { '555-5555' }
    ship_area_id { 7 }
    city { '横浜市' }
    bill {'ビル'}
    house_number { 1 - 2 - 3 }
    phone_number { 19_012_345_678 }
    token { 'tok_abcdefghijk00000000000000000' }
    user_id {"1"}
    good_id {"1"}
  end
end
