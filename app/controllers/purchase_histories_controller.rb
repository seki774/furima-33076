class PurchaseHistoriesController < ApplicationController
  def index
    # フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase = Form.new
    @good = Good.find(params[:item_id])
  end

  # def new
  #  @form =  Form.new(params[:id])
  # end

  def create
    @purchase = Form.new(form_params)
    @good = Good.find(params[:item_id])
    if @purchase.valid?
      pay_item
      # @purchase.save
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :ship_area_id, :city, :bill, :house_number,
                                 :phone_number).merge(token: params[:token])
  end

  def pay_item
    Payjp.api_key = 'sk_test_e2df649dd28e555404d3aa63' # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @good.goods_price, # 商品の値段
      card: form_params[:token],    # カードトークン
      currency: 'jpy'
    )
  end
end
