class KimonosController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :show, :edit]
  before_action :find_kimono, only: [:show, :edit, :update, :destroy, :redirect_root]
  before_action :redirect_root, only: [:show, :edit, :destroy]
  before_action :search_goods, only: [:search, :result]

  def index
    if user_signed_in?
      @kimonos = current_user.kimonos.order("created_at DESC")
    end
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

  def show
  end

  def edit
  end
  
  def update
    if @kimono.update(kimono_params)
      redirect_to kimono_path
    else
      render :edit
    end
  end

  def destroy
    if @kimono.destroy
      redirect_to root_path
    end
  end

  def search
    if user_signed_in?
      @kimonos = current_user.kimonos.order("created_at DESC")
      set_kimono_column
    end
  end

  def result
    @results = @p.result
  end

  private

  def find_kimono
    @kimono = Kimono.find(params[:id])
  end

  def redirect_root
    if current_user != @kimono.user
      redirect_to root_path
    end
  end

  def kimono_params
    params.require(:kimono).permit(:kimono_name_id, :kimono_genre_id, :tpo_id, :material_id, :color_pattern, :season, :wore_date, :cleaned_date, :memo, :image).merge(user_id: current_user.id)
  end

  def search_goods
    @p = Kimono.ransack(params[:q])
  end

  def set_kimono_column
    @kimono_name = Kimono.select("kimono_name_id").distinct
    @kimono_genre = Kimono.select("kimono_genre_id").distinct
  end
end
