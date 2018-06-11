require 'rails_helper'

describe Section do
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

  it "puede tener uno o más usuarios" do 
    section = described_class.reflect_on_association(:user)
    expect(section.macro).to eq :has_many
  end
end
