class User < ApplicationRecord
  has_many :items
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates  :nickname, :last_name, :first_name, :last_name_kana, :first_name_kana, :birth_date, presence: true
  validates  :password, length: { minimum: 6 }

  with_options format: {with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i, message: 'Password Include both letters and numbers'} do
    validates :password
  end
  with_options format: {with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'Full-width characters'} do
    validates :last_name
    validates :first_name
  end
  with_options format: {with: /\A[ァ-ン]+\z/, message: 'Full-width katakana characters'} do
    validates :last_name_kana
    validates :first_name_kana
  end
end
