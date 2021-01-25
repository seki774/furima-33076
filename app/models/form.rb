class Form
  include ActiveModel::Model
  attr_accessor :postal_code,:ship_area_id,:bill,:city,:house_number,:phone_number

  # has_many :goods
  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :ship_area_id
    validates :bill
    validates :city
    validates :house_number
    validates :phone_number
  end

  
def save
     Address.create(postal_code: postal_code, ship_area_id: ship_area_id, bill: bill, city: city, house_number: house_number, phone_number: phone_number)

  end
end