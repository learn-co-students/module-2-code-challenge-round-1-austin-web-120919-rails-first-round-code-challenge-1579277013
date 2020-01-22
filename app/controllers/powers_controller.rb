class PowersController < ApplicationController
  before_action :set_power, only: [:show, :update, :edit]

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

  def edit
  end

  def update
    @power.update(power_params(:name,:description))
    @heroine_ids = params[:power][:heroine_ids]
    if @heroine_ids.any?
      @power.heroine_powers.clear
      @heroine_ids.each {|heroine_id| HeroinePower.create(power_id: @power.id, heroine_id: heroine_id)}
    end
    redirect_to (@power)
  end

  private

  def set_power
    @power = Power.find(params[:id])
  end

  #explictly setting the keys prevents accidentally trying to persist keys without column names
  # heroine_ids can be set like => heroine_ids: [] 
  def power_params(*args)
    params.require(:power).permit(*args)
  end

end
