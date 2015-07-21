class ReviewsController < ApplicationController
  def index
  end

  def new
  end

  def create
    p "*" * 99
    p params
    @movie = Movie.find(params[:movie_id])
    @review = Review.create(reviews_params)
    @movie.reviews << @review
    redirect_to movie_path(@movie)
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end

  def all
    @reviews = Review.all
  end

  private
    def reviews_params
      params.require(:review).permit(:name, :email, :content, :score)
    end
end
