require 'rails_helper'

RSpec.describe User, :type => :model do
    it "Se pueden añadir nuevos usuarios manualmente" do
        @new_user = User.new(first_name: "Samuel", last_name: "Valcarcel", gender: "Chico", age: "23", username: "cosaca", total_lines: "40", completed_levels: "20", section_id: "1", user_value_reference: "7.5")
        @new_user.save
        expect(User.find_by(first_name: "Samuel")).to eq(@new_user)
    end
end