class Garden < ApplicationRecord
  has_many :plots
  has_many :plants, through: :plots

  validates :name, presence: true
  validates :organic, presence: true, inclusion: { in: [true, false] }
end
