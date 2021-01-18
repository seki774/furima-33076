class Good < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :good_state
  belongs_to :ship_area

  with_options presence: true do
    validates :goods_name
    validates :goods_text 
    validates :category_id
    validates :good_state_id
    validates :delivery_fee_id
    validates :ship_area_id
    validates :day_id
    validates :image
  end

  with_options numericality:  { other_than: 0 } do
    validates :category_id
    validates :good_state_id
    validates :delivery_fee_id
    validates :ship_area_id
    validates :day_id
  end

  validates :goods_price ,presence: true, format: { with: /^[0-9]*$/, message: '半角数字を使用してください' }

  
end