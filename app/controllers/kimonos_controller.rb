class KimonosController < ApplicationController
  before_action :authenticate_user!, expect: [:index]

  def index
  end

  def new
    @kimono = Kimono.new
  end

  def create
    @kimono = Kimono.new(kimono_params)
    if @kimono.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def kimono_params
    params.require(:kimono).permit(:kimono_name_id, :kimono_genre_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end

end
