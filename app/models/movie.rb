class Movie < ActiveRecord::Base
  has_many :reviews

  validates :title, :genre, :thumbnail, :url, :release_date, presence: true

  validates :url, uniqueness: true
end
