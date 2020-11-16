class ObisController < ApplicationController

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
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def obi_params
    params.require(:obi).permit(:obi_name_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end

end
