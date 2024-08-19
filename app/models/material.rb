class Material < ApplicationRecord
  belongs_to :project

  validates :name, presence: true
  validates :store, presence: true
  validates :estimated_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :paid_value, presence: true, numericality: { greater_than_or_equal_to: 0 }
end