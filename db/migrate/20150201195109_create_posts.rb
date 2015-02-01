class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :subject, null: false
      t.string :content, null: false
    end
  end
end
