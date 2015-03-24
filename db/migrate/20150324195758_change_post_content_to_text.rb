class ChangePostContentToText < ActiveRecord::Migration
  def change
    remove_column :posts, :content, :string
    add_column :posts, :content, :text
    add_column :posts, :created_at, :datetime
    add_column :posts, :updated_at, :datetime
  end
end
