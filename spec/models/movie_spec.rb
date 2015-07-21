require 'rails_helper'

RSpec.describe Movie, type: :model do
  before :each do
    Movie.destroy_all
  end

  it {validate_presence_of(:title)}
  it {validate_presence_of(:genre)}
  it {validate_presence_of(:thumbnail)}
  it {validate_presence_of(:url)}
  it {validate_presence_of(:release_date)}
  it {have_many(:reviews)}

  describe "uniqueness" do
    let(:movie) {Movie.new(title: "Fast 5",
                           genre: "Action",
                           thumbnail: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fast_Five_logo.png",
                           url: "http://www.fastfive.com/",
                           release_date: Date.new(2011, 4, 29))}
    before {Movie.create!(title: "Fast 5",
                           genre: "Action",
                           thumbnail: "https://upload.wikimedia.org/wikipedia/commons/3/3f/Fast_Five_logo.png",
                           url: "http://www.fastfive.com/",
                           release_date: Date.new(2011, 4, 29))}
    it "does not allow the saving of duplicates" do
      expect(movie).to be_invalid
    end
  end
end
