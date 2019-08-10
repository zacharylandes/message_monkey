class AddVisitDateToMessage < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :visit_date, :string
  end
end
