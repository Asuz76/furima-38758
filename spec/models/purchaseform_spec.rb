require 'rails_helper'

RSpec.describe Purchaseform, type: :model do
  describe '発送先情報の登録' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @purchaseform = FactoryBot.build(:purchaseform, item_id: @item.id, user_id: @user.id)
    end

    context '発送先情報の登録ができるとき' do
      it '必要事項が全て正しく入力されていれば保存できる' do
        expect(@purchaseform).to be_valid
      end
      it '建物名が空でも保存できる' do
        @purchaseform.building = nil
        expect(@purchaseform).to be_valid
      end
    end

    context '発送先情報の登録ができないとき' do
      it 'tokenが空だと購入ができない' do
        @purchaseform.token = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Token can't be blank")
      end
      it 'user_idが空だと保存できない' do
        @purchaseform.user_id = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空だと保存できない' do
        @purchaseform.item_id = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空だと保存できない' do
        @purchaseform.postal_code = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Postal code can't be blank",
                                                              'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できない' do
        @purchaseform.postal_code = 1_234_567
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Postal code is invalid. Include hyphen(-)')
      end
      it 'prefecture_idがない場合は保存できない' do
        @purchaseform.prefecture_id = 1
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Prefecture can't be blank")
      end
      it 'cityが空の場合は保存できない' do
        @purchaseform.city = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空の場合は保存できない' do
        @purchaseform.adress = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Adress can't be blank")
      end
      it 'phone_numberが空の場合は保存できない' do
        @purchaseform.phone_number = nil
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include("Phone number can't be blank")
      end
      it 'phone_numberにハイフンがある場合は保存できない' do
        @purchaseform.phone_number = '090-1234-5678'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberが12桁以上の場合は保存できない' do
        @purchaseform.phone_number = '090123456789'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number is invalid')
      end
      it 'phone_numberがが9桁以下の場合は保存できない' do
        @purchaseform.phone_number = '090123456'
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number is invalid')
      end
    end
  end
end
