class Section < ApplicationRecord
    belongs_to :course

    has_many :users, dependent: :destroy
end
