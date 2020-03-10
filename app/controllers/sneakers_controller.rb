class SneakersController < ApplicationController
  before_action :set_sneaker, only:[:show]

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)

    if @sneaker.save
      @sneaker.user_id = session[:user_id]
      @sneaker.sneaker_image.purge
      @sneaker.sneaker_image.attach(params[:sneaker][:sneaker_image])
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
    params.require(:sneaker).permit(:name, :price, :description)
  end

  def set_sneaker
   @sneaker = Sneaker.find(params[:id])
   redirect_to sneakers_path if !@sneaker
 end

end
