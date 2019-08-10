class AddPersonToMessages < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :person_id, :string
  end
end
