class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites
  has_many :book_comments, dependent: :destroy
  
  validates :title, presence: true
  validates :body, presence: true
  validates :body, presence: false, length: { maximum: 200 }
  
end
