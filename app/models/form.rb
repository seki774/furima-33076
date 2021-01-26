class Form
  include ActiveModel::Model
  attr_accessor :postal_code,:ship_area_id,:bill,:city,:house_number,:phone_number,:token

  
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :ship_area_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
  end

  validates :postal_code, format: { with: /\A\d{3}[-]\d{4}\z/, message: '郵便番号にはハイフンが必要であること' }
  validates :phone_number, length:{ maximum: 11}
 
  with_options numericality: { other_than: 0 } do
    validates :ship_area_id
  end
  
def save
     Address.create(postal_code: postal_code, ship_area_id: ship_area_id, bill: bill, city: city, house_number: house_number, phone_number: phone_number)

  end
end