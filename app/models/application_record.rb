class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  
  has_many :favorites
  has_many :likes, through: :favorites, source: :favorite
  
  def favorite(micropost)
     
    self.favorites.find_or_create_by(favorite_id: user_id)
  end
  
  def unfavorite(micropost)
    favorite = self.favorites.find_by(favorite_id: micropost_id)
    favorite.destroy if favorite
  end
  
  def favo?(micropost)
    self.likes.include?(micropost)
  end
  
end
