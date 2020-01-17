class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]
  
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
    @powers = Power.all
  end

  def create
    @heroine = Heroine.new(heroine_params(:name))
    if @heroine.save
      powers = Power.find(id: params[:powers])
      powers.each {|power| @heroine.powers << power}
      @heroine.heroine_powers << @power
      redirect_to heroine_path(@heroine)
    else
      render :new
    end
  end

  def show
  end


  private

  def set_heroine
    @heroine = Heroine.find(params[:id])
  end

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end
end
