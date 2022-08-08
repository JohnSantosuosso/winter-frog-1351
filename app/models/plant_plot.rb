class PlantPlot < ApplicationRecord
  belongs_to :plot
  belongs_to :plant

  validates :plant, presence: true
  validates :plot, presence: true
end
