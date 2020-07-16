class Micropost < ApplicationRecord
  belongs_to :user
  #UserとMicropostsの1対多
  validates :content, presence: true, length: { maximum: 255 }
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :micropost
  
  def favorite(micropost)
    self.favorites.find_or_create_by(favorite_id: micropost_id)
  end
  
  def unfavorite(micropost)
    favorite = self.favorites.find_by(favorite_id: micropost_id)
    favorite.destroy if favorite
  end
  
  def favo?(micropost)
    self.likes.include?(micropost)
  end
  
end
