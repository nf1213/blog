class AddBlogImageToPost < ActiveRecord::Migration
  def change
    add_column :posts, :blog_image, :string
  end
end
