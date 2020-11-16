class ObisController < ApplicationController
  before_action :authenticate_user!
  before_action :find_obi, only: [:show, :edit, :update, :destroy, :redirect_root]
  before_action :redirect_root, only: [:show, :edit, :destroy]

  def index
    if user_signed_in? 
      @obis = current_user.obis.order("created_at DESC")
    end
  end

  def new
    @obi = Obi.new
  end

  def create
    @obi = Obi.new(obi_params)
    if @obi.save
      redirect_to obis_path
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @obi.update(obi_params)
      redirect_to obi_path
    else
      render :edit
    end
  end

  def destroy
    if @obi.destroy
      redirect_to obis_path
    end
  end

  private

  def find_obi
    @obi = Obi.find(params[:id])
  end

  def redirect_root
    if current_user != @obi.user
      redirect_to root_path
    end
  end

  def obi_params
    params.require(:obi).permit(:obi_name_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end

end
