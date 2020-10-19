class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :items

  REAL_NAME_REGEX = /\A[ぁ-んァ-ン一-龥]+\z/.freeze
  FRIGANA_REGEX = /\A[ァ-ン]+\z/.freeze

  with_options presence: true do
    validates :nickname
    validates :birth_day
    validates :last_name, format: { with: REAL_NAME_REGEX, message: 'Full-width characters' }
    validates :first_name, format: { with: REAL_NAME_REGEX, message: 'Full-width characters' }
    validates :last_name_kana, format: { with: FRIGANA_REGEX, message: 'Full-width katakana characters' }
    validates :first_name_kana, format: { with: FRIGANA_REGEX, message: 'Full-width katakana characters' }
  end

  validates :password, confirmation: true # パスワードと確認用パスワードが一致しているかのバリデーション

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze
  validates_format_of :password, with: PASSWORD_REGEX, message: 'Include both letters and numbers'
end
