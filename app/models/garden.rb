class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  validates :name, presence: true
  validates :organic, presence: true, inclusion: { in: [true, false] }

  def unique_plants_to_harvest
    self.plots
    .joins(:plants)
    .where('days_to_harvest < 100')
    .distinct
    .pluck(:name)
  end

end
