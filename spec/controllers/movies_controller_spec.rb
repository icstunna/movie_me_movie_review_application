require 'rails_helper'

RSpec.describe MoviesController, type: :controller do
  before :all do
    Movie.destroy_all
    @movie = Movie.create!(title: "Fast 5",
                           genre: "Action",
                           thumbnail: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fast_Five_logo.png",
                           url: "http://www.fastfive.com/",
                           release_date: Date.new(2011, 4, 29))
  end

  describe "#show" do
    it "shows the movie page" do
      get :show, id: @movie.id
      expect(response).to render_template(:show)
    end
  end

end
