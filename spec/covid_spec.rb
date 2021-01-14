require_relative 'spec_helper'
require_relative '../lib/covid'

RSpec.describe CovidNumbers do
  let(:covid) { CovidNumbers.new }

  describe '#initialize' do
    it 'should set the @country' do
      expect(covid.instance_variable_get(:@country)).to eq('')
    end
  end
end
