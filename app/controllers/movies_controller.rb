class MoviesController < ApplicationController
  def index
    @movies = Movie.order(params[:sort])
  end

  def create
    movies_data = params[:data]
    #Below is my algorithm for parsing the API object into fields that I may use to save in my database
    movies_data["results"].each do |movie_object|
      Movie.create!(title: movie_object[1]["name"],
                    genre: movie_object[1]["genre"],
                    thumbnail: movie_object[1]["thumbnail"],
                    url: movie_object[1]["url"],
                    release_date: movie_object[1]["rlsdate"]
                    )

    end

    # This returns a JSON object back to my Dom to be appended unto the body once parsed
    render :json => {movies: Movie.all}
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
