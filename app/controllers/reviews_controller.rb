class ReviewsController < ApplicationController

  def create
    @movie = Movie.find(params[:movie_id])
    @review = Review.create!(reviews_params)
    @movie.reviews << @review
    redirect_to movie_path(@movie)
  end

  def all
    @reviews = Review.all
  end

  private
    #The internet is scary and should use strong parameters
    def reviews_params
      params.require(:review).permit(:name, :email, :content, :score)
    end
end
