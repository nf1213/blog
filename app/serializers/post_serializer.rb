class PostSerializer < ActiveModel::Serializer
  attributes :id, :subject, :content, :created_at, :updated_at, :blog_image, :instagram_link
end
