class MoviesController < ApplicationController
  def index
    @movies = Movie.order(params[:sort])
  end

  def new
  end

  def create
    movies_data = params[:data]
    movies_data["results"].each do |movie_object|
      Movie.create!(title: movie_object[1]["name"],
                    genre: movie_object[1]["genre"],
                    thumbnail: movie_object[1]["thumbnail"],
                    url: movie_object[1]["url"],
                    release_date: movie_object[1]["rlsdate"]
                    )

    end

    render :json => {movies: Movie.all}
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
  end

  def update
  end

  def destroy
  end
end
