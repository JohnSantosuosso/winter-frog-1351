class Plot < ApplicationRecord
  belongs_to :garden
  has_many :plant_plots
  has_many :plants, through: :plant_plots

  validates :number, presence: true, numericality: { only_integer: true }
  validates :size, presence: true, numericality: { only_integer: true }
  validates :direction, presence: true

end
