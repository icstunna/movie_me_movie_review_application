class MoviesController < ApplicationController
  def index
    @movies = Movie.order("title")
  end

  def new
  end

  def create
    movies_data = params[:data]
    movies_data["results"].each do |movie_object|
      begin
        Movie.create!(title: movie_object[1]["name"],
                      genre: movie_object[1]["genre"],
                      thumbnail: movie_object[1]["thumbnail"],
                      url: movie_object[1]["url"],
                      release_date: movie_object[1]["rlsdate"]
                      )
      rescue => e
        p e
        next
      end
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
