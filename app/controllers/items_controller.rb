class ItemsController < ApplicationController
  before_action :authenticate_user!

  def index
    if user_signed_in? 
      @items = current_user.obis.order("created_at DESC")
    end
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(obi_params)
    if @item.save
      redirect_to items_path
    else
      render :new
    end
  end
end
