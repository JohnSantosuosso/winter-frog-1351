require 'rails_helper'

RSpec.describe Garden do
  describe 'relationships' do
    it { should have_many(:plots) }
    it { should have_many(:plants).through(:plots) }
  end

  describe 'validations' do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:organic) }
  end

  describe 'instance methods' do
    garden_1 = Garden.create!(name: 'My Garden', organic: true)
    plot_1 = garden_1.plots.create!(number: 1, size: 'small', direction: 'South')
    plot_2 = garden_1.plots.create!(number: 2, size: 'medium', direction: 'North')
    plot_3 = garden_1.plots.create!(number: 3, size: 'large', direction: 'West')
    plant_1 = Plant.create!(name: 'Tomato', description: 'Red', days_to_harvest: 5)
    plant_2 = Plant.create!(name: 'Potato', description: 'Brown', days_to_harvest: 99)
    plant_3 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 150)
    plant_4 = Plant.create!(name: 'Celery', description: 'Green', days_to_harvest: 20)
    plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_1.id)
    plant_plot_4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    plant_plot_5 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_3.id)

    it '#unique_plants_to_harvest' do
      expect(garden_1.unique_plants_to_harvest).to eq([plant_4.name, plant_2.name, plant_1.name])
    end
  end
end
