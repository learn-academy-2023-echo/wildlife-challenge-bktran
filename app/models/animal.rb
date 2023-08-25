class Animal < ApplicationRecord
  has_many :sightings
  validates :common_name, :scientific_binomial, presence: true
  validates :common_name, :scientific_binomial, uniqueness: true
  validate :name_cannot_match_binomial

  def name_cannot_match_binomial
    if common_name === scientific_binomial
      errors.add(:common_name, "cannot match scientific_binomial")
    end
  end
end

