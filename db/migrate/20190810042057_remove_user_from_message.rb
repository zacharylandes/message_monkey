class RemoveUserFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :user_id, :string
  end
end
