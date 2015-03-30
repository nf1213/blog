class Post < ActiveRecord::Base
  mount_uploader :blog_image, BlogImageUploader
  has_many :comments, dependent: :destroy

  validates_presence_of :subject
end
