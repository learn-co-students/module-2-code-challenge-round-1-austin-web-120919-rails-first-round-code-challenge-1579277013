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
    #could also be @heroine = Heroine.create(heroine_params)
    if @heroine.save
      #you won't need line 20 with power_ids in the strong params explictly
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

  # you could specify the permitted params keys explictly to be able to cal Heroine.create(heroine_params)
  # we want to be defensive about which keys we allow to be persisted to the database

  def heroine_params(*args)
    params.require(:heroine).permit(*args)
  end
end
