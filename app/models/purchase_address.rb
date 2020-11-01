class PurchaseAddress
  include ActiveModel::Model
  attr_accessor :prefecture_id, :postal_code, :city, :house_number, :building_name, :phone_number, :user_id, :item_id, :token, :price

  POSTAL_CODE_REGEX = /\A\d{3}[-]\d{4}\z/.freeze
  PHONE_NUMBER_REGEX = /\A\d+\z/.freeze

  with_options presence: true do
    validates :postal_code, format: { with: POSTAL_CODE_REGEX, message: 'Input correctly' }
    validates :city
    validates :house_number
    validates :phone_number, format: { with: PHONE_NUMBER_REGEX, message: 'Input only number' }, length: { maximum: 11 }
    validates :token
  end

  with_options numericality: { other_than: 1, message: 'Select' } do
    validates :prefecture_id
  end

  def save
    purchase = Purchase.create(user_id: user_id, item_id: item_id)
    Address.create(prefecture_id: prefecture_id, postal_code: postal_code, city: city, house_number: house_number, building_name: building_name, phone_number: phone_number, purchase_id: purchase.id)
  end
end
