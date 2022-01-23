class Post < ApplicationRecord
  belongs_to:user
  attachment:image
  has_many:favorites,dependent: :destroy
  has_many:comments,dependent: :destroy
  
  def favorite_by(user)
    favorites.where(user_id:user.id).exists?
  end
end
