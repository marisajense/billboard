class Song < ApplicationRecord
  belongs_to :billboard
  belongs_to :artist
  validates :title, presence: true
  validates :genre, presence: true
end
