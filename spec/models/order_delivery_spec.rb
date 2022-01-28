require 'rails_helper'

RSpec.describe OrderDelivery, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_delivery = FactoryBot.build(:order_delivery, user_id: user.id, item_id: item.id)
    sleep 0.1
  end

  describe '購入情報と配送先の保存' do
    context '内容に問題ない場合' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_delivery).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @order_delivery.building_name = ''
        expect(@order_delivery).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it 'post_codeが空だと保存できない' do
        @order_delivery.post_code = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと保存できない' do
        @order_delivery.post_code = '9999999'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Post code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idが空では保存できない' do
        @order_delivery.prefecture_id = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'prefecture_idの値が1では保存できない' do
        @order_delivery.prefecture_id = 1
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空では保存ができない' do
        @order_delivery.city = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空では保存できない' do
        @order_delivery.address = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Address can't be blank")
      end
      it 'user_idが紐づいていなければ保存できない' do
        @order_delivery.user_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが紐づいていなければ保存できない' do
        @order_delivery.item_id = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Item can't be blank")
      end
      it 'tokenが空では保存できない' do
        @order_delivery.token = nil
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Token can't be blank")
      end
      it 'telが空では保存できない' do
        @order_delivery.tel = ''
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include("Tel can't be blank")
      end
      it 'telが半角ハイフン(-)を含む形では保存できない' do
        @order_delivery.tel = '999-9999-9999'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it '全角数字を含むtelは保存できない' do
        @order_delivery.tel = '９９９９９９９９９９９'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Tel is invalid', 'Tel is not a number')
      end
      it 'telが9桁以下では保存できない' do
        @order_delivery.tel = '99999999'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Tel is invalid')
      end
      it 'telは12桁以上では保存できない' do
        @order_delivery.tel = '999999999999'
        @order_delivery.valid?
        expect(@order_delivery.errors.full_messages).to include('Tel is invalid')
      end
    end
  end
end
