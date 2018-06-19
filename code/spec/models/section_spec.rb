require 'rails_helper'

RSpec.describe Section, :type => :model do
  subject { described_class.new }

  it "se comprueba con atributos válidos" do
    subject.name = 'Prueba de título'
    expect(subject).to be_valid
  end

  it "no se valida sin título" do
    expect(subject).to_not be_valid
  end

  it "pertenece a un curso" do
    section = described_class.reflect_on_association(:course)
    expect(section.macro).to eq :belongs_to 
  end

  it "debe tener uno o más usuarios" do 
    should have_many(:users)
  end

  it "Se pueden añadir nuevos usuarios" do
    @new_user = User.new(first_name: "Samuel", last_name: "Valcarcel", gender: "Chico", age: "23", username: "cosaca", total_lines: "40", completed_levels: "20", section_id: "1", user_value_reference: "7.5")
    @new_user.save
    expect(User.find_by(first_name: "Samuel")).to eq(@new_user)
  end

  it "Se pueden eliminar usuarios" do
    @new_user = User.new(first_name: "Samuel", last_name: "Valcarcel", gender: "Chico", age: "23", username: "cosaca", total_lines: "40", completed_levels: "20", section_id: "1", user_value_reference: "7.5")
    @new_user.destroy
  end

  it "No se validan los usuarios sin todos los atributos" do
    @new_user = User.new(first_name: "Nombre")
    expect(@new_user).to_not be_valid
  end

  it "La edad debe ser en números" do 
    @new_user = User.new(age: "Años")
    expect(@new_user).to_not be_valid
  end
end
