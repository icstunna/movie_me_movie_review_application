class Review < ActiveRecord::Base
  belongs_to :movie

  validates :name, :email, :content, :score, presence: true
end
