class PowersController < ApplicationController
  before_action :set_power, only: [:show]

  def index
    @powers = Power.all
  end

  def new
    @power = Power.new
  end

  def create
    @power = Power.new(power_params(:name))
    if @power.valid?
      @power.save
      redirect_to (@power)
    else
      redirect :new
    end
  end

  def show
  end 

  private

  def set_power
    @power = Power.find(params[:id])
  end 

  def power_params(*args)
    params.require(:power).permit(*args)
  end

end
