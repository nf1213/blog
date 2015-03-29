class AddInstagramLinkToPost < ActiveRecord::Migration
  def change
    add_column :posts, :instagram_link, :string
  end
end
