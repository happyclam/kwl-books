class Book < ActiveRecord::Base
  belongs_to :genre
  validates :title, presence: true
  validates :itemNumber, presence: true, uniqueness: true
  
end
