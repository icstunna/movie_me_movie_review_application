class MoviesController < ApplicationController
  def index
  end

  def new
  end

  def create
    p "*" *99
    p params[:x]
    # movies = params[:x]
    # movies.each do |movie_hash|
    #   p movie_hash
    # end
  end

  def edit
  end

  def show
  end

  def update
  end

  def destroy
  end
end
