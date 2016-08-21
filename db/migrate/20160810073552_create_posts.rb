class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.text	:text
      t.text	:title
      t.text	:movie_link
      t.integer :user
      t.timestamps
    end
  end
end
