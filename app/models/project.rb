class Project < ApplicationRecord
  belongs_to :user
  has_many :workers, dependent: :destroy
  has_many :materials, dependent: :destroy

  validates :name, presence: true
  validates :description, presence: true
end