require 'rails_helper'

RSpec.describe PurchaseAddress, type: :model do
  before do
    @address = FactoryBot.build(:purchase_address)
  end

  describe '商品購入機能' do
    it 'すべての必須項目の値が正しく入力されていれば保存できること' do
      expect(@address).to be_valid
    end

    it 'tokenが空では保存できないこと' do
      @address.token = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Token can't be blank")
    end

    it 'postal_codeが空では保存できないこと' do
      @address.postal_code = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Postal code can't be blank")
    end

    it 'cityが空では保存できないこと' do
      @address.city = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("City can't be blank")
    end

    it 'house_numberが空では保存できないこと' do
      @address.house_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("House number can't be blank")
    end

    it 'phone_numberが空では保存できないこと' do
      @address.phone_number = nil
      @address.valid?
      expect(@address.errors.full_messages).to include("Phone number can't be blank")
    end

    it 'prefectureを選択していないと保存できないこと' do
      @address.prefecture_id = 1
      @address.valid?
      expect(@address.errors.full_messages).to include('Prefecture Select')
    end

    it '郵便番号にハイフンが必要であること' do
      @address.postal_code = '1234567'
      @address.valid?
      expect(@address.errors.full_messages).to include('Postal code Input correctly')
    end

    it '電話番号はハイフン不要であること' do
      @address.phone_number = '090-1234-5678'
      @address.valid?
      expect(@address.errors.full_messages).to include('Phone number Input only number')
    end
  end
end
