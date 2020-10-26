class Address < ApplicationRecord
  belongs_to :purchase

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :prefecture

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A[0-9]+\z/.freeze

  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'Input correctly'}
    validates :city
    validates :house_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'Input only number' }
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end
end
