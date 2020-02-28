class ReviewsController < ApplicationController

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
    @review = current_user.reviews.build(review_params)
    if @review.save

      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
    @review = Review.find_by_id(params[:id])
  end

  private

  def review_params
    params.require(:review).permit(:sneaker_id, :stars, :recommendation, :title, :thoughts)
  end
end
