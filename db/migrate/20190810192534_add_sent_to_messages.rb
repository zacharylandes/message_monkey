class AddSentToMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :sent, :boolean
    add_column :messages, :sent, :boolean, defult: false
  end
end
