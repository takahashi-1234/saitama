class Tag < ApplicationRecord
  has_many:tag_maps,dependent: :destroy
  has_many:posts,through: :tag_maps,source: :post
  paginates_per 3
end
