require 'factory_girl'

FactoryGirl.define do
  factory :backpack do
    #just here so the initializer can behave like a rails model
    initialize_with { new(attributes) }
  end
end
