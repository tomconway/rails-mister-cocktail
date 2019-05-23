# require 'open-uri'

# url = 'https://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

# new_ingredients = []

# JSON.parse(URI.open(url).read)['drinks'].each do |drink|
#   new_ingredients << { name: drink['strIngredient1'] }
# end

# Ingredient.create(new_ingredients)

require 'open-uri'
require 'faker'
url = 'http://www.thecocktaildb.com/api/json/v1/1/list.php?i=list'

new_ingredients = []

JSON.parse(URI.open(url).read)['drinks'].each do |drink|
  new_ingredients << { name: drink['strIngredient1'] }
end

def random_ingredient_id
  rand(Ingredient.count) + 1
end

def random_cocktail_id
  rand(Cocktail.count) + 1
end

Ingredient.create(new_ingredients)

measures = %w[parts]

20.times do
  Cocktail.create(name: "#{Faker::Lorem.word} #{Faker::Lorem.word}")
end

100.times do
  Dose.create(description: "#{rand(1..5)} #{measures.sample}",
              ingredient: Ingredient.find(random_ingredient_id),
              cocktail: Cocktail.find(random_cocktail_id))
end




