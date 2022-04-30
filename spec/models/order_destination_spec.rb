require 'rails_helper'

RSpec.describe OrderDestination, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_destination = FactoryBot.build(:order_destination, user_id: user.id, item_id: item.id)
  end

  context '入力内容に問題がない場合' do
    it 'すべての値が正しく入力されていれば購入できる' do
      expect(@order_destination).to be_valid
    end
    it 'building_nameが空でも購入できる' do
      @order_destination.building_name = ''
      expect(@order_destination).to be_valid
    end
  end
  context '入力内容に問題がある場合' do
    it 'tokenが空では購入できない' do
      @order_destination.token = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Token can't be blank")
    end
    it 'postal_codeが空では購入できない' do
      @order_destination.postal_code = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Postal code can't be blank")
    end
    it 'postal_codeが「3桁ハイフン4桁」の半角文字列以外では購入できない' do
      @order_destination.postal_code = '1111111'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
    end
    it 'cityが空では購入できない' do
      @order_destination.city = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("City can't be blank")
    end
    it 'addressが空では購入できない' do
      @order_destination.address = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Address can't be blank")
    end
    it 'phone_numberが空では購入できない' do
      @order_destination.phone_number = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Phone number can't be blank")
    end
    it 'phone_numberが10桁以上11桁以内の半角数値以外では購入できない（10桁未満の値を検証）' do
      @order_destination.phone_number = '123456789'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number must be 10 digits or more and 11 digits or less')
    end
    it 'phone_numberが10桁以上11桁以内の半角数値以外では購入できない（11桁を超える値を検証）' do
      @order_destination.phone_number = '012345678901'
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include('Phone number must be 10 digits or more and 11 digits or less')
    end
    it 'prefecture_idが空では購入できない' do
      @order_destination.prefecture_id = ''
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'prefecture_idが1では購入できない' do
      @order_destination.prefecture_id = 1
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Prefecture can't be blank")
    end
    it 'userと紐づいていなければ購入できない' do
      @order_destination.user_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("User can't be blank")
    end
    it 'itemと紐づいていなければ購入できない' do
      @order_destination.item_id = nil
      @order_destination.valid?
      expect(@order_destination.errors.full_messages).to include("Item can't be blank")
    end
  end
end
