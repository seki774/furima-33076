class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  def index
    @goods = Good.all.order("day_id DESC")
  end

  def new
    @good = Good.new
  end

  def create
    @good = Good.new(good_params)
    if @good.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def good_params
    params.require(:good).permit(:goods_name, :goods_price, :goods_text, :category_id, :good_state_id, :delivery_fee_id,
                                 :ship_area_id, :day_id, :image).merge(user_id: current_user.id)
  end
end
