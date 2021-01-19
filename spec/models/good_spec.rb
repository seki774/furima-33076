require 'rails_helper'
describe User do
  before do
    @good = FactoryBot.build(:good)
  end

  describe '商品出品機能' do
    context '商品出品がうまくいくとき' do
      it 'goods_nameとgoods_textとgoods_priceとcategory_idとgood_state_idとdelivery_fee_idとship_area_idとday_idとimageが存在すれば出品できる' do
        expect(@good).to be_valid
      end
    end

    context '商品出品がうまくいかないとき' do
      it 'goods_nameが空だと登録できない' do
        @good.goods_name = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Goods name can't be blank")
      end

      it 'goods_textが空では登録できない' do
        @good.goods_text = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Goods text can't be blank")
      end
      it 'category_idが空では登録できない' do
        @good.category_id = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Category can't be blank")
      end
      it 'good_state_idが空では登録できない' do
        @good.good_state_id = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Good state can't be blank")
      end
      it 'delivery_fee_idが空では登録できない' do
        @good.delivery_fee_id = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it 'ship_area_idが空では登録できない' do
        @good.ship_area_id = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Ship area can't be blank")
      end
      it 'day_idが空では登録できない' do
        @good.day_id = ''
        @good.valid?
        expect(@good.errors.full_messages).to include("Day can't be blank")
      end
      it 'imageが空では登録できない' do
        @good.image = nil
        @good.valid?
        expect(@good.errors.full_messages).to include("Image can't be blank")
      end

      it 'goods_priceが9999999を超えると登録できない' do
        @good.goods_price = '10000000'
        @good.valid?
        expect(@good.errors.full_messages).to include('Goods price は9999999を超えられない')
      end

      it 'goods_priceが300以下であれば登録できない' do
        @good.goods_price = '299'
        @good.valid?
        expect(@good.errors.full_messages).to include('Goods price は300以下にならない')
      end

      it 'goods_priceは全角数字では登録できない' do
        @good.goods_price = '５００００'
        @good.valid?
        expect(@good.errors.full_messages).to include('Goods price 半角数字を使用してください')
      end

      it 'category_idが0以外では登録できない' do
        @good.category_id = '0'
        @good.valid?
        expect(@good.errors.full_messages).to include("Category must be other than 0")
      end
      it 'good_state_idが0以外では登録できない' do
        @good.good_state_id = '0'
        @good.valid?
        expect(@good.errors.full_messages).to include("Good state must be other than 0")
      end
      it 'delivery_fee_idが0以外では登録できない' do
        @good.delivery_fee_id = '0'
        @good.valid?
        expect(@good.errors.full_messages).to include("Delivery fee must be other than 0")
      end
      it 'ship_area_idが0以外では登録できない' do
        @good.ship_area_id = '0'
        @good.valid?
        expect(@good.errors.full_messages).to include("Ship area must be other than 0")
      end
      it 'day_idが0以外では登録できない' do
        @good.day_id = '0'
        @good.valid?
        expect(@good.errors.full_messages).to include("Day must be other than 0")
      end
    end
  end
end
