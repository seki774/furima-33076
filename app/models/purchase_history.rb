class PurchaseHistory < ApplicationRecord
  belongs_to :user
  belongs_to :good
  has_one    :address
end
