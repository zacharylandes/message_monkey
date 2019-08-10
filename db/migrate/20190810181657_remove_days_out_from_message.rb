class RemoveDaysOutFromMessage < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :days_out, :string

  end
end
