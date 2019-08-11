class AddVisitDateToPerson < ActiveRecord::Migration[5.2]
  def change
    add_column :people, :visit_date, :string
  end
end
