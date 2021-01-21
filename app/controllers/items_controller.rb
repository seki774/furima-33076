class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  def index
    @goods = Good.all.order("created_at DESC")
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


  def show
    @good = Good.find(params[:id])
  end

  def edit
    @good = Good.find(params[:id])
  end

  def update
    @good = Good.find(params[:id])    
    @good.update(good_params)
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

  def move_to_index
    unless user_signed_in?
      redirect_to action: :index
    end
  end
end

