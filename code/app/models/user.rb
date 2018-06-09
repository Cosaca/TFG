class User < ApplicationRecord
    validates :first_name, :last_name, :username, :gender, :age, :total_lines, :completed_levels, presence: true

    belongs_to :section
end
