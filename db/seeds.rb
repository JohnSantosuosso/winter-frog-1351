# turing_garden = Garden.create!(name: 'Turing Community Garden', organic: true)
# library_garden = Garden.create!(name: 'Public Library Garden', organic: true)
# other_garden = Garden.create!(name: 'Main Street Garden', organic: false)

# turing_garden.plots.create!(number: 25, size: "Large", direction: "East")
# turing_garden.plots.create!(number: 26, size: "Small", direction: "West")
# library_garden.plots.create!(number: 2, size: "Small", direction: "South")
# other_garden.plots.create!(number: 738, size: "Medium", direction: "West")


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
    plant_plot_6 = PlantPlot.create!(plant_id: plant_1.id, plot_id: plot_2.id)
    