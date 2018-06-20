require 'rails_helper'

RSpec.describe Course, :type => :model do
    subject { described_class.new }

    it "Se comprueba con atributos válidos" do
        subject.title = 'Prueba de título'
        subject.body = 'Prueba de descripción'
        subject.value_reference = 'Valor de referencia'
        expect(subject).to be_valid
    end

    it "No se valida sin título" do
        expect(subject).to_not be_valid
    end

    it "No se valida sin descripción" do
        subject.title = "Prueba de descripción"
        expect(subject).to_not be_valid
    end

    it "No se valida sin valor de referencia" do
        subject.value_reference = "Prueba de valor de referencia"
        expect(subject).to_not be_valid
    end

    it "Tiene uno o más usuarios en las secciones de ese curso" do
        should have_many(:users).through(:sections)
    end

    it "Se pueden añadir cursos" do
        @new_course = Course.new(title: "Titulo", body: "Descripcion", value_reference: "10")
        @new_course.save
        expect(Course.find_by(title: "Titulo")).to eq(@new_course)
    end
end
