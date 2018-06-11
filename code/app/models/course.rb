class Course < ApplicationRecord
    validates :title, presence: true, uniqueness: true
    validates :body, :value_reference, presence: true

    belongs_to :teacher
    has_many :sections, dependent: :destroy
    has_many :users, through: :sections
end
