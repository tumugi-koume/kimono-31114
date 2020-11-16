class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in? 
      @items = current_user.items.order("created_at DESC")
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end
end
