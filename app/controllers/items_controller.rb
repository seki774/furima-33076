class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]
  before_action :move_to_index, only: [:edit]
  before_action :params_id, only: [:show, :edit, :update]
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
    
  end

  def edit
    
  end

  def update

   if @good.update(good_params)
    redirect_to root_path 
    else
      render :edit
    end
  end
  
  private

  def good_params
    params.require(:good).permit(:goods_name, :goods_price, :goods_text, :category_id, :good_state_id, :delivery_fee_id,
                                 :ship_area_id, :day_id, :image).merge(user_id: current_user.id)
  end

  def move_to_index
      redirect_to action: :index
    end

    def params_id
      @good = Good.find(params[:id])
  end
end

