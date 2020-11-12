class KimonosController < ApplicationController
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
    params.require(:kimono).permit(:kimono_name_id, :kimono_genre_id, :tpo_id, :material_id)
  end

end
