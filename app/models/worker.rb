class Worker < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :position, presence: true
  validates :phone_number, presence: true
  validates :estimated_labor_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :paid_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :construction_material_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :worked_hours, presence: true, numericality: { only_integer: true, greater_than_or_equal_to: 0 }
end