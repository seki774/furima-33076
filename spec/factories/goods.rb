FactoryBot.define do
  factory :good do
    goods_name { 'あああああああ' }
    goods_text { 'あああああああ' }
    goods_price { '3000' }
    category_id { '2' }
    good_state_id { '2' }
    delivery_fee_id { '2' }
    ship_area_id { '2' }
    day_id { '2' }

    after(:build) do |message|
      message.image.attach(io: File.open('public/images/test_image.png'), filename: 'test_image.png')
    end
  end
end
