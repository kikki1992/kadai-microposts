class Micropost < ApplicationRecord
  belongs_to :user
  #UserとMicropostsの1対多
  validates :content, presence: true, length: { maximum: 255 }
end
