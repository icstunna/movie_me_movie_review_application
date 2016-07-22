class MoviesController < ApplicationController
  def index
    @movies = Movie.order(params[:sort])
  end

  def create
    movies_data = params[:data]
    #Below is my algorithm for parsing the API object into fields that I may use to save in my database

    # p "*" * 99
    # p movies_data
    # p movies_data["data"]["0"]["title"]
    # p movies_data["data"]["0"]["genre"]
    # p movies_data["data"]["0"]["poster"]
    # p movies_data["data"]["0"]["url"]
    # p movies_data["data"]["0"]["release-date"]

    Movie.create!(
      title: movies_data["data"]["0"]["title"],
      genre: movies_data["data"]["0"]["genre"],
      thumbnail: movies_data["data"]["0"]["poster"],
      url: movies_data["data"]["0"]["url"],
      release_date: movies_data["data"]["0"]["release-date"]
    )

    # This returns a JSON object back to my Dom to be appended unto the body once parsed
    render :json => {movies: Movie.all}
  end

  def show
    @movie = Movie.find(params[:id])
  end

end
