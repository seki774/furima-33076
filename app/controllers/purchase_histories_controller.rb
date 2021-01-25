class PurchaseHistoriesController < ApplicationController

  def index
    #フォームオブジェクトのインスタンスを生成し、インスタンス変数に代入する
    @purchase =  Form.new
    @good = Good.find(params[:item_id])
    #@good = Good.find(params[:id])
  end

  # def new
  #  @form =  Form.new(params[:id])
  # end


  def create
    @purchase = Form.new(form_params)
    @good = Good.find(params[:item_id])
    if @purchase.valid?
      redirect_to action: :index
    else
      render action: :index
    end
  end

  private

  def form_params
    params.permit(:postal_code, :ship_area_id, :city, :bill, :phone_number,
      :house_number)
  end
end
