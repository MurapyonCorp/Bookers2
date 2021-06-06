class RemoveUserIdFromUsers < ActiveRecord::Migration[6.1]
  def change
    remove_column :users, :user_id, :integer
  end
end
