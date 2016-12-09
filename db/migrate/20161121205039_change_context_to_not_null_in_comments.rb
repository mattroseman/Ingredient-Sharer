class ChangeContextToNotNullInComments < ActiveRecord::Migration
  def change
    change_column_null :comments, :content, false
  end
end
