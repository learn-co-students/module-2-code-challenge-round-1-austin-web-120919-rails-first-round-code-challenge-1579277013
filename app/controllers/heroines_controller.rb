require 'pry'

class HeroinesController < ApplicationController
  before_action :set_heroine, only: [:show]
  
  def index
    @heroines = Heroine.all
  end

  def new
    @heroine = Heroine.new
  end

  def create
    @heroine = Heroine.new(heroine_params(:name,:super_name))
    @power_ids = params[:heroine][:power_ids]
    if @heroine.save
      @power_ids.each {|power| @heroine.heroine_powers.build(power_id: power).save}
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
