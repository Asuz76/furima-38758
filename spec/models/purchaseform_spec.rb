require 'rails_helper'

RSpec.describe Purchaseform, type: :model do
  before do
    @purchaseform = FactoryBot.build(:purchaseform)
  end

  describe '発送先情報の登録' do
    context '発送先情報の登録ができるとき' do
      it '必要事項が全て正しく入力されていれば保存できる' do
        expect(@purchaseform).to be_valid
      end
    end

    context '発送先情報の登録ができないとき' do
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
        expect(@purchaseform.errors.full_messages).to include("Postal code can't be blank", 'Postal code is invalid. Include hyphen(-)')
      end
      it '郵便番号にハイフンがないと保存できない' do
        @purchaseform.postal_code = 1234567
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
        @purchaseform.phone_number = "090123456789"
        @purchaseform.valid?
        expect(@purchaseform.errors.full_messages).to include('Phone number is invalid')
      end
      # it 'トークンが空だと保存できない' do
      #   @purchaseform.token = nil
      #   @purchaseform.valid?
      #   expect(@purchaseform.errors.full_messages).to include("Token can't be blank")
      # end
    end
  end
end