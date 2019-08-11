class ChangeVisitDate < ActiveRecord::Migration[5.2]
  def change
    remove_column :messages, :visit_date, :string
    add_column :messages, :visit_date, :date

  end
end
