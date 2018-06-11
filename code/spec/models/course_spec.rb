require 'rails_helper'

describe Course do
  subject { described_class.new }

  it "se comprueba con atributos válidos" do
    subject.title = 'Prueba de título'
    subject.body = 'Prueba de descripción'
    expect(subject).to be_valid
  end

  it "no se valida sin título" do
    expect(subject).to_not be_valid
  end

  it "no se valida sin descripción" do
    subject.title = "Prueba de descripción"
    expect(subject).to_not be_valid
  end
end
