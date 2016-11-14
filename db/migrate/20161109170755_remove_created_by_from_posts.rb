class RemoveCreatedByFromPosts < ActiveRecord::Migration
  def change
    remove_column :posts, :created_by, :string
  end
end
