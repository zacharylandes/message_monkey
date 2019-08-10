class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|

      t.string  :email
      t.string  :full_name
      t.string  :phone_number
      t.string  :status 
      t.timestamps
      
    end
  end
end
