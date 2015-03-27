class Post < ActiveRecord::Base
  mount_uploader :blog_image, BlogImageUploader
  has_many :comments, dependent: :destroy

  validates :subject,
    presence: true

  validates :content,
    presence: true
end
