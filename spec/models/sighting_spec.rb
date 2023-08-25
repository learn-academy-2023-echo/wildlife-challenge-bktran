require 'rails_helper'

RSpec.describe Sighting, type: :model do
  my_animal = Animal.create(common_name: 'cat', scientific_binomial: 'felix')

  it 'is valid with valid atrributes' do
    sight_1 = my_animal.sightings.create(latitude:"12.32", longitude: "343.23", date: "2023-06-12" )
    expect(sight_1).to be_valid
  end

  it 'is not valid without latitude, longitude, and date' do
    sight_1 = my_animal.sightings.create()
    expect(sight_1.errors[:latitude]).to_not be_empty
    expect(sight_1.errors[:longitude]).to_not be_empty
    expect(sight_1.errors[:date]).to_not be_empty
  end


end
