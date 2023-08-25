require 'rails_helper'

RSpec.describe Animal, type: :model do
  it 'is valid with valid attributes' do
    my_animal = Animal.create(common_name:'meow', scientific_binomial: 'felis')
    expect(my_animal).to be_valid
  end

  it 'is not valid without a common name and scientific binomial' do
    my_animal = Animal.create()
    expect(my_animal.errors[:common_name]).to_not be_empty
    expect(my_animal.errors[:scientific_binomial]).to_not be_empty
  end

  it 'common name cannot match scientific binomial' do
    my_animal = Animal.create(common_name: "cat", scientific_binomial: "cat")
    expect(my_animal.errors[:common_name]).to_not be_empty
  end
end
