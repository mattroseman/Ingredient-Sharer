class AddIsRequestToPosts < ActiveRecord::Migration
  def change
    add_column :posts, :is_request, :boolean
  end
end
