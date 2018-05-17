class CreateUsers < ActiveRecord::Migration[5.2]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.integer :age
      t.integer :total_lines
      t.integer :completed_levels

      t.timestamps
    end
  end
end
