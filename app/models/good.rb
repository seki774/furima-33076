class Good < ApplicationRecord
  has_one_attached :image
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :day
  belongs_to :delivery_fee
  belongs_to :good_state
  belongs_to :ship_area
  belongs_to :user
  has_one    :purchase_history
  belongs_to :form

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

  with_options numericality: { other_than: 0 } do
    validates :category_id
    validates :good_state_id
    validates :delivery_fee_id
    validates :ship_area_id
    validates :day_id
  end

  validates :goods_price, presence: true, numericality: { with: /\d/, message: '半角数字を使用してください' }
  validates :goods_price, numericality: { greater_than_or_equal_to: 300, message: 'は300以下にならない' }
  validates :goods_price, numericality: { less_than_or_equal_to: 9_999_999, message: 'は9999999を超えられない' }
end
