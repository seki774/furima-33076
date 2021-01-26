class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :move_to_index, only: [:create]

  def index
    @purchase = Form.new
    @good = Good.find(params[:item_id])
  end



  def create
    @purchase = Form.new(form_params)
    @good = Good.find(params[:item_id])
    if @purchase.valid?
      pay_item
      redirect_to root_path
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
    Payjp.api_key = 'sk_test_e2df649dd28e555404d3aa63' 
    Payjp::Charge.create(
      amount: @good.goods_price, 
      card: form_params[:token],    
      currency: 'jpy'
    )
  end

  def move_to_index
    redirect_to root_path if current_user.id != params_id.user.id
  end
end
