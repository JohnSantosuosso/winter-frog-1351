class Plant < ApplicationRecord
  has_many :plant_plots
  has_many :plots, through: :plant_plots

  validates :name, presence: true
  validates :description, presence: true
  validates :days_to_harvest, presence: true, numericality: { only_integer: true }
end
