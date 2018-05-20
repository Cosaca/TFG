class Course < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

    belongs_to :teacher
    has_many :users
end
