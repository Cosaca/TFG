class ModifySchema < ActiveRecord::Migration[5.2]
  def change
    add_reference :users, :section, foreign_key: true
    remove_reference :sections, :teacher, foreign_key: true
    remove_reference :users, :teacher, foreign_key: true
    remove_reference :users, :course, foreign_key: true
  end
end
