class AddReferenceValueToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :value_reference, :float
    add_column :users, :user_value_reference, :float
  end
end
