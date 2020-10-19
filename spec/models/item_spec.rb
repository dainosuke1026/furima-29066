require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do
    it 'すべての値が正しく入力されていれば保存できること' do
      expect(@item).to be_valid
    end

    it 'imageが空では保存できないこと' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Image can't be blank")
    end

    it 'nameが空では保存できないこと' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Name can't be blank")
    end

    it 'descriptionが空では保存できないこと' do
      @item.description = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Description can't be blank")
    end

    it 'priceが空では保存できないこと' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include("Price can't be blank")
    end

    it 'priceが全角数字だと保存できないこと' do
      @item.price = '１０００'
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Half-width number')
    end

    it 'priceが300円未満では保存できないこと' do
      @item.price = 299
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'priceが9,999,999円を超過すると保存できないこと' do
      @item.price = 10_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('Price Out of setting range')
    end

    it 'categoryを選択していないと保存できないこと' do
      @item.category_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Category Select')
    end

    it 'statusを選択していないと保存できないこと' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Status Select')
    end

    it 'costを選択していないと保存できないこと' do
      @item.cost_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Cost Select')
    end

    it 'prefectureを選択していないと保存できないこと' do
      @item.prefecture_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Prefecture Select')
    end

    it 'dayを選択していないと保存できないこと' do
      @item.day_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('Day Select')
    end
  end
end
