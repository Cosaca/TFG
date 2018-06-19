require 'rails_helper'

RSpec.describe Course, :type => :model do
  subject { described_class.new }

  it "se comprueba con atributos válidos" do
    subject.title = 'Prueba de título'
    subject.body = 'Prueba de descripción'
    subject.value_reference = 'Valor de referencia'
    expect(subject).to be_valid
  end

  it "no se valida sin título" do
    expect(subject).to_not be_valid
  end

  it "no se valida sin descripción" do
    subject.title = "Prueba de descripción"
    expect(subject).to_not be_valid
  end

  it "no se valida sin valor de referencia" do
    subject.value_reference = "Prueba de valor de referencia"
    expect(subject).to_not be_valid
  end

  it "tiene uno o más usuarios en las secciones de ese curso" do
    should have_many(:users).through(:sections)
  end
end
