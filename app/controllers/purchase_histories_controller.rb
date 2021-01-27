class PurchaseHistoriesController < ApplicationController
  before_action :authenticate_user!, only: [:index]
  before_action :good_params, only:[:index, :create, :move_to_index]
  before_action :move_to_index, only: [:index, :create]
  
  def index
    @purchase = Form.new
  end



  def create
    
    @purchase = Form.new(form_params)
  
    if @purchase.valid?
      pay_item
      @purchase.save
      redirect_to root_path
    else
      render action: :index
    end
  end

  private

  def form_params
    params.require(:form).permit(:postal_code, :ship_area_id, :city, :bill, :house_number,
                                 :phone_number).merge(token: params[:token], user_id: current_user.id, good_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
    Payjp::Charge.create(
      amount: @good.goods_price, 
      card: form_params[:token],    
      currency: 'jpy'
    )
    
  end

  def move_to_index
    redirect_to root_path if current_user.id != @good.user_id || @good.purchase_history == "1" 
  end


  def good_params
    @good = Good.find(params[:item_id])
  end

end
