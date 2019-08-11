class ChangeVisitDate < ActiveRecord::Migration[5.2]
  def change
    add_column :messages, :visit_date, :date

  end
end
