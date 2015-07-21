require 'rails_helper'

RSpec.describe ReviewsController, type: :controller do
  before :all do
    Movie.destroy_all
    @movie = Movie.create!(title: "Fast 5",
                           genre: "Action",
                           thumbnail: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fast_Five_logo.png",
                           url: "http://www.fastfive.com/",
                           release_date: Date.new(2011, 4, 29))
  end

  describe "#create" do
    it "should redirect to movie page" do
      post :create, {movie_id: @movie.id, review: {name: "Mikhail", email: "test-email@gmail.com", content: "This movie rocked!", score: 9}}
      expect(response).to redirect_to(movie_path(@movie))
    end
  end

  describe "#all" do
    it "successfully reaches the all route" do
      get :all
      expect(response).to be_success
    end

    it "shows the all reviews page" do
      get :all
      expect(response).to render_template(:all)
    end
  end
end
