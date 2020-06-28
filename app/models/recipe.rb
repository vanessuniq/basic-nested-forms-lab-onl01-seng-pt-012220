class Recipe < ActiveRecord::Base
  has_many :ingredients
  accepts_nested_attributes_for :ingredients, reject_if: :ingredient_exist

  def ingredient_exist(attributes)
    ingredients.find_by(name: attributes[:name], quantity: attributes[:quantity])
  end
end
