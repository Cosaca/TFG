require 'rails_helper'

RSpec.describe Section, :type => :model do
    subject { described_class.new }

    it "Se comprueba con atributos válidos" do
        subject.name = 'Prueba de título'
        expect(subject).to be_valid
    end

    it "No se valida sin título" do
        expect(subject).to_not be_valid
    end

    it "Pertenece a un curso" do
        section = described_class.reflect_on_association(:course)
        expect(section.macro).to eq :belongs_to 
    end

    it "Debe tener uno o más usuarios" do 
        should have_many(:users)
    end

    it "Se pueden añadir nuevos usuarios desde fichero" do
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

    it "Las líneas de código deben ser en números" do 
        @new_user = User.new(total_lines: "Líneas")
        expect(@new_user).to_not be_valid
    end

    it "Los niveles completados deben ser en números" do 
        @new_user = User.new(age: "Niveles")
        expect(@new_user).to_not be_valid
    end

    it "Se pueden añadir secciones" do
        @new_section = Section.new(name: "Nombre")
        @new_section.save
        expect(Section.find_by(name: "Nombre")).to eq(@new_section)
    end
end
