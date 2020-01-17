class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]


  def index
    @heroines = Heroine.all
  end

  def show
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params(:super_name, :name, heroine_powers_attributes: [:power_id]))
    if @heroine.valid?
      @heroine.save
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end

end
