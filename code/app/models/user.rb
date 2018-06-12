class User < ApplicationRecord
    validates :first_name, :last_name, :username, :user_value_reference, :gender, :age, :total_lines, :completed_levels, presence: true

    belongs_to :section
end
