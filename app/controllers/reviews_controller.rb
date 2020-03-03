class ReviewsController < ApplicationController
  # before_action :set_sneaker, only:[:show]

  def new
    if @sneaker = Sneaker.find_by_id(params[:sneaker_id])
      @review = @sneaker.reviews.build
    else
      @review = Review.new
    end
  end

  def index
    if params[:sneaker_id] #nested
      @sneakers = Sneaker.find_by_id(params[:sneaker_id])
      @reviews = @sneakers.reviews
    else
      @reviews = Review.all #everything else
    end
  end

  def create
    if logged_in?
      @review = current_user.reviews.build(review_params)

      @review.save
        redirect_to review_path(@review)
    else
      flash[:error] = "You're not logged in to review sneakers!"
      redirect_to '/'
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  private

  # def set_sneaker
  #  @sneaker = Sneaker.find_by(params[:id])
  #  redirect_to sneakers_path if !@sneaker
  # end

  def review_params
    params.require(:review).permit(:sneaker_id, :name, :stars, :recommendation, :title, :thoughts)
  end
end
