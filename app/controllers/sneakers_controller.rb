class SneakersController < ApplicationController
  before_action :set_sneaker, only:[:show]

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    @sneaker.user_id = session[:user_id]

    if @sneaker.save
      redirect_to sneaker_path(@sneaker)
    else
      render :new
    end
  end

  def index
    @sneakers = Sneaker.all.ordered
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:name, :price, :description, :sneaker_image)
  end

  def set_sneaker
   @sneaker = Sneaker.find_by(params[:id])
   redirect_to sneakers_path if !@sneaker
 end

end
