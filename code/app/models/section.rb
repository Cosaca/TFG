class Section < ApplicationRecord
    validates :name, presence: true, uniqueness: true

    belongs_to :course

    has_many :users, dependent: :destroy
end
