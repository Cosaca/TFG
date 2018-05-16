class Course < ApplicationRecord
    belongs_to :teacher
    validates :title, presence: true, uniqueness: true
    validates :body, presence: true

end
