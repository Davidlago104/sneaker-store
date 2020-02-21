class SneakersController < ApplicationController

  def new
    @sneaker = Sneaker.new
    @sneaker.build_brand
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
    @sneakers = Sneaker.all
  end

  private

  def sneaker_params
    params.require(:sneaker).permit(:name, :price, :descrpition, :brand_id, brand_attributes: [:name])
  end
end
