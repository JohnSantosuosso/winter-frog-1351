require 'rails_helper'

RSpec.describe Plot do
  describe 'relationships' do
    it { should belong_to(:garden) }
    it { should have_many(:plant_plots) }
    it { should have_many(:plants).through(:plant_plots) }
  end

  describe 'validations' do
    it { should validate_presence_of(:number) }
    it { should validate_presence_of(:size) }
    it { should validate_presence_of(:direction) }
  end

  describe 'class methods' do
    it 'find_plants' do
      garden = Garden.create!(name: 'My Garden', organic: true)
      plot = Plot.create!(number: 1, size: 'small', direction: 'north', garden_id: garden.id)
      plant1 = Plant.create!(name: 'plant1', description: 'description1', days_to_harvest: 1)
      plant2 = Plant.create!(name: 'plant2', description: 'description2', days_to_harvest: 2)

      plant_plot1 = PlantPlot.create!(plant_id: plant1.id, plot_id: plot.id)
      plant_plot2 = PlantPlot.create!(plant_id: plant2.id, plot_id: plot.id)

      expect(plot.find_plants).to eq([plant1, plant2])
    end
  end
end
