class Item < ApplicationRecord
  belongs_to :user
  has_one_attached :image

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :category
  belongs_to_active_hash :status
  belongs_to_active_hash :cost
  belongs_to_active_hash :prefecture
  belongs_to_active_hash :day

  PRICE_REGEX = /\A[1-9][\d]+\z/.freeze

  with_options presence: true do
    validates :image
    validates :name
    validates :description
    validates :price, format: { with: PRICE_REGEX, message: 'Half-width number' }
  end

  validates :price, numericality: { greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999, message: 'Out of setting range' }

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :category_id
    validates :status_id
    validates :cost_id
    validates :prefecture_id
    validates :day_id
  end
end
