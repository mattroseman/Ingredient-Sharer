class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title
      t.text :content
      t.string :location
      t.datetime :posted_time
      t.integer :ttl

      t.timestamps null: false
    end
  end
end
