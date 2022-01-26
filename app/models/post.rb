class Post < ApplicationRecord
  belongs_to:user
  attachment:image
  has_many:favorites,dependent: :destroy
  has_many:comments,dependent: :destroy
  has_many:tag_maps,dependent: :destroy
  has_many:tags,through: :tag_maps,source: :tag
  def favorite_by(user)
    favorites.where(user_id:user.id).exists?
  end
  
  def save_tag(sent_tags)
    current_tags=self.tags.pluck(:tag_name) unless self.tags.nil?
    old_tags=current_tags-sent_tags
    new_tags=sent_tags-current_tags
    
    old_tags.each do |old|
      self.tags.delete Tag.find_by(tag_name:old)
    end
    new_tags.each do |new|
      new_review_tag=Tag.find_or_initialize_by(tag_name:new)
      self.tags << new_review_tag
    end
  end
end
