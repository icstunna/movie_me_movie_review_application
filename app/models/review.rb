class Review < ActiveRecord::Base
  belongs_to :movie

  validates :title, :genre, :thumbnail, :url, :release_date, presence: true
end
