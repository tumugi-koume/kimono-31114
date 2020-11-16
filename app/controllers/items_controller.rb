class ItemsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_item, only: [:show, :edit, :update, :destroy, :redirect_root]
  before_action :redirect_root, only: [:show, :edit, :destroy]

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

  def show
  end

  def edit
  end

  def update
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    if @item.destroy
      redirect_to items_path
    end
  end

  private

  def find_item
    @item = Item.find(params[:id])
  end

  def redirect_root
    if current_user != @item.user
      redirect_to root_path
    end
  end

  def item_params
    params.require(:item).permit(:item_name_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end
end
