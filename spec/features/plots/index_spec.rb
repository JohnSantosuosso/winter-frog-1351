require 'rails_helper'

RSpec.feature 'Plots', type: :feature do
  it 'User can see the index page with list of all plot numbers and names of all plants in that plot' do
    garden_1 = Garden.create!(name: 'My Garden', organic: true)
    garden_2 = Garden.create!(name: 'Jardin', organic: true)
    plot_1 = garden_1.plots.create!(number: 1, size: 'small', direction: 'South')
    plot_2 = garden_1.plots.create!(number: 2, size: 'medium', direction: 'North')
    plot_3 = garden_1.plots.create!(number: 3, size: 'large', direction: 'West')
    plot_4 = garden_2.plots.create!(number: 4, size: 'small', direction: 'South')

    plant_1 = Plant.create!(name: 'Tomato', description: 'Red', days_to_harvest: 5)
    plant_2 = Plant.create!(name: 'Potato', description: 'Brown', days_to_harvest: 10)
    plant_3 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 15)
    plant_4 = Plant.create!(name: 'Celery', description: 'Green', days_to_harvest: 20)

    plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_1.id)
    plant_plot_4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    plant_plot_5 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_3.id)
    plant_plot_6 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_4.id)
    
    visit '/plots'
    
    expect(page).to have_content 'Plots'

    expect(page).to have_content(plot_1.number)
    expect(page).to have_content(plot_2.number)
    expect(page).to have_content(plot_3.number)
    

    within("#plot-#{plot_1.id}") do
      expect(page).to have_content('Tomato')
      expect(page).to have_content('Potato')
      expect(page).to have_content('Carrot')
      expect(page).to have_no_content('Celery')
    end

    within("#plot-#{plot_2.id}") do
      expect(page).to have_content('Celery')
      expect(page).to have_no_content('Tomato')
      expect(page).to have_no_content('Potato')
      expect(page).to have_no_content('Carrot')
    end

    within("#plot-#{plot_3.id}") do
      expect(page).to have_content('Celery')
      expect(page).to have_no_content('Tomato')
      expect(page).to have_no_content('Potato')
      expect(page).to have_no_content('Carrot')
    end

    within("#plot-#{plot_4.id}") do
      expect(page).to have_content('Celery')
      expect(page).to have_no_content('Tomato')
      expect(page).to have_no_content('Potato')
      expect(page).to have_no_content('Carrot')
    end

  end

  it "sees a button next to each plot's plants that when clicked, deletes that plant from that plot and returns to plots page" do
    garden_1 = Garden.create!(name: 'My Garden', organic: true)
    plot_1 = garden_1.plots.create!(number: 1, size: 'small', direction: 'South')
    plot_2 = garden_1.plots.create!(number: 2, size: 'medium', direction: 'North')


    plant_1 = Plant.create!(name: 'Tomato', description: 'Red', days_to_harvest: 5)
    plant_2 = Plant.create!(name: 'Potato', description: 'Brown', days_to_harvest: 10)
    plant_3 = Plant.create!(name: 'Carrot', description: 'Orange', days_to_harvest: 15)
    plant_4 = Plant.create!(name: 'Celery', description: 'Green', days_to_harvest: 20)

    plant_plot_1 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_1.id)
    plant_plot_2 = PlantPlot.create!(plant_id: plant_2.id, plot_id: plot_1.id)
    plant_plot_3 = PlantPlot.create!(plant_id: plant_3.id, plot_id: plot_1.id)
    plant_plot_4 = PlantPlot.create!(plant_id: plant_4.id, plot_id: plot_2.id)
    plant_plot_5 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_2.id)
    
    visit '/plots'

    within("#plot-#{plot_1.id}") do
      expect(page).to have_content('Tomato')
      expect(page).to have_content('Potato')
      expect(page).to have_content('Carrot')

      click_on 'Delete Tomato'

      expect(page).to have_no_content('Tomato')
      expect(page).to have_content('Potato')
      expect(page).to have_content('Carrot')
    end

    within("#plot-#{plot_2.id}") do
      expect(page).to have_content('Tomato')
      expect(page).to have_content('Celery')
    end
  end

end