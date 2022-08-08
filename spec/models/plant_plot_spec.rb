require 'rails_helper'

RSpec.describe PlantPlot do
  describe 'relationships' do
    it { should belong_to(:plant) }
    it { should belong_to(:plot) }
  end

  describe 'validations' do
    it { should validate_presence_of(:plant) }
    it { should validate_presence_of(:plot) }
  end
end