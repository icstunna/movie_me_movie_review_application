class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title, :genre, :thumbnail, :url, :release_date, presence: true

  validates :url, uniqueness: true #This is to prevent saving any duplicate movies whenever the API call is requested
end
