class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :books
  has_many :user_images, dependent: :destroy
  has_many :favorites
  has_many :book_comments, dependent: :destroy

  attachment :profile_image

  validates :name, presence: true, uniqueness: true, length: {minimum: 2, maximum: 20}
  validates :introduction, presence: false, length: { maximum: 50 }

  def liked_by?(book_id)
    favorites.where(book_id: book_id).exists?
  end
end
