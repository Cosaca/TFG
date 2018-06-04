class User < ApplicationRecord
    validates :username, presence: true, uniqueness: true
    validates :first_name, :last_name, :gender, :age, :total_lines, :completed_levels, presence: true

    belongs_to :sections
end
