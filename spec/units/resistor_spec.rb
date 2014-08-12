require 'spec_helper'

describe Electric::Resistor do
  before do
    @subject = Electric::Resistor.new("red", "black", "brown")
  end

  it 'has a value' do
    expect(@subject.value).to eq(200)
  end

  it 'has a tolerance' do
    expect(@subject.tolerance).to eq("5%")
  end

  it 'has a human_readable output' do
    expect(@subject.human_readable).to eq("200 ohms, +/- 5%")
  end
end
