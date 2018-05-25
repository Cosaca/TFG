class ModifySections < ActiveRecord::Migration[5.2]
  def change
    add_reference :sections, :teacher, foreign_key: true
    add_reference :sections, :course, foreign_key: true
  end
end
