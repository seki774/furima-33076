class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

        # validates :last_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
        # validates :first_name, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/}
        # validates :last_name_hurigana, format: { with: /\A[/^([ァ-ン]|ー)+$/]+\z/}
        # validates :first_name_hurigana, format: { with: /\A[/^([ァ-ン]|ー)+$/]+\z/}

end
