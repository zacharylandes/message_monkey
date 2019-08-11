class AddSentToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :sent, :boolean, defult: false
  end
end
