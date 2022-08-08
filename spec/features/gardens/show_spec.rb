require 'rails_helper'

RSpec.feature 'Garden Show', type: :feature do
  it "User sees a list of all plants included in that garden's plots which is unique and only includes plants less than 100 days to harvest" do
    garden_1 = Garden.create!(name: 'My Garden', organic: true)
    garden_2 = Garden.create!(name: 'Jardin', organic: true)
    plot_1 = garden_1.plots.create!(number: 1, size: 'small', direction: 'South')
    plot_2 = garden_1.plots.create!(number: 2, size: 'medium', direction: 'North')
    plot_3 = garden_1.plots.create!(number: 3, size: 'large', direction: 'West')
    plot_4 = garden_2.plots.create!(number: 4, size: 'small', direction: 'South')
    plant_1 = Plant.create!(name: 'Tomato', description: 'Red', days_to_harvest: 5)
    plant_2 = Plant.create!(name: 'Potato', description: 'Brown', days_to_harvest: 99)
    plant_3 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 150)
    plant_4 = Plant.create!(name: 'Celery', description: 'Green', days_to_harvest: 20)
    plant_5 = Plant.create!(name: 'Eggplant', description: 'Purple', days_to_harvest: 99)
    plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_1.id)
    plant_plot_4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    plant_plot_5 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_3.id)
    plant_plot_6 = PlantPlot.create!(plant_id: plant_5.id, plot_id: plot_4.id)

    visit "/gardens/#{garden_1.id}"

    expect(page).to have_content('My Garden')
    expect(page).to have_no_content('Jardin')

    expect(page).to have_content('Tomato')
    expect(page).to have_content('Potato')
    expect(page).to have_no_content('Carrot')
    expect(page).to have_content('Celery', count: 1)
    expect(page).to have_no_content('Eggplant')
  end
end