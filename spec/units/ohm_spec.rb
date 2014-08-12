require 'spec_helper'

describe Electric::Ohm do
  before do
    @subject = Electric::Ohm.new(volts: 5, ohms: 330)
  end

  it 'calculates voltage' do
    expect(@subject.voltage).to eq(5.0)
  end

  it 'calculates resistance' do
    expect(@subject.resistance).to eq(330.0)
  end

  it 'calculates current' do
    expect(@subject.current).to eq(0.015151515151515152)
  end

  it 'calculates power' do
    expect(@subject.power).to eq(0.07575757575757576)
  end
end
