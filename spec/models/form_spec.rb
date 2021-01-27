require 'rails_helper'

describe PurchaseHistory do
  before do
    @purchase = FactoryBot.build(:form)
  end

  describe '商品購入機能' do
    context '商品購入がうまくいくとき' do
      it '必要な情報を適切に入力すると、商品の購入ができる' do
        expect(@purchase).to be_valid
      end

      it 'ビル名がなくても登録できる' do
        @purchase.bill = ""
        expect(@purchase).to be_valid
      end
    end

    context '商品購入がうまくいかないとき' do
      it 'postal_codeが空だと登録できない' do
        @purchase.postal_code = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Postal code can't be blank")
      end

      it 'ship_area_idが空では登録できない' do
        @purchase.ship_area_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Ship area can't be blank")
      end
      it 'cityが空では登録できない' do
        @purchase.city = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("City can't be blank")
      end
      it 'house_numberが空では登録できない' do
        @purchase.house_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("House number can't be blank")
      end
      it 'phone_numberが空では登録できない' do
        @purchase.phone_number = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Phone number can't be blank")
      end

      it 'tokenが空では登録できない' do
        @purchase.token = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Token can't be blank")
      end

      it 'user_idが空では登録できない' do
        @purchase.user_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("User can't be blank")
      end

      it 'good_idが空では登録できない' do
        @purchase.good_id = ''
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include("Good can't be blank")
      end

      it 'postal_codeにハイフンがなければ購入できない' do
        @purchase.postal_code = '1111111'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Postal code 郵便番号にはハイフンが必要であること')
      end

      it 'phone_numberが11文字いないでなければ登録できない' do
        @purchase.phone_number = '123456789123'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Phone number is too long (maximum is 11 characters)')
      end

      it 'ship_area_idが0以外では登録できない' do
        @purchase.ship_area_id = '0'
        @purchase.valid?
        expect(@purchase.errors.full_messages).to include('Ship area must be other than 0')
      end
    end
  end
end
