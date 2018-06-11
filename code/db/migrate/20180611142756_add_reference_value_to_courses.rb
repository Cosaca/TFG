class AddReferenceValueToCourses < ActiveRecord::Migration[5.2]
  def change
    add_column :courses, :value_reference, :integer
  end
end
