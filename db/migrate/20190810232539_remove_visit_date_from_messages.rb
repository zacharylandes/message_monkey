class RemoveVisitDateFromMessages < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :sent, :boolean
    remove_column :messages, :visit_date, :date

    add_column :messages, :sent, :boolean, defult: false
  end
end
