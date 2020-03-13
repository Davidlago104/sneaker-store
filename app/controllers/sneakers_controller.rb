class SneakersController < ApplicationController
  before_action :set_sneaker, only:[:show]
  before_action :logged_in?, only:[:new, :create]

  def new
    @sneaker = Sneaker.new
  end

  def create
    @sneaker = Sneaker.new(sneaker_params)
    #allows the sneaker to be saved as well as posting images for that sneaker
    if @sneaker.save
      @sneaker.user_id = session[:user_id]
      @sneaker.sneaker_image.purge
      @sneaker.sneaker_image.attach(params[:sneaker][:sneaker_image])
      redirect_to sneaker_path(@sneaker)
    else
      render :new
    end
  end

  def index #all of the sneakers in order by the alphabet
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
