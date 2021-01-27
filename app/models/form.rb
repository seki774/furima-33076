class Form
  include ActiveModel::Model
  attr_accessor :postal_code, :ship_area_id, :bill, :city, :house_number, :phone_number, :token, :user_id, :good_id

  # ここにバリデーションの処理を書く
  with_options presence: true do
    validates :postal_code
    validates :ship_area_id
    validates :city
    validates :house_number
    validates :phone_number
    validates :token
    validates :user_id
    validates :good_id
  end

  validates :postal_code, format: { with: /\A\d{3}-\d{4}\z/, message: '郵便番号にはハイフンが必要であること' }
  # validates :phone_number, length: { maximum: 11 }
  validates :phone_number,  length: { maximum: 11 }, numericality: { with: /\d/, message: '半角数字を使用してください' }
  with_options numericality: { other_than: 0 } do
    validates :ship_area_id
  end

  def save
    purchase_history = PurchaseHistory.create(good_id: good_id, user_id: user_id)

    Address.create(postal_code: postal_code, ship_area_id: ship_area_id, bill: bill, city: city, house_number: house_number,
                   phone_number: phone_number, purchase_history_id: purchase_history.id)
    

  end
end
