# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
unless User.where(:email => 'john@gmail.com').present?
  user = User.create!(:name => 'John Doe', :email => 'john@gmail.com', :password => 'topsecret', :password_confirmation => 'topsecret')
end


sourdough = Recipe.find_or_create_by({ name: 'Basic Sourdough', user: user});
challah = Recipe.find_or_create_by({ name: 'Challah', user: user});
wheat = Recipe.find_or_create_by({ name: 'Country Wheat', user: user});

recipes = [sourdough, challah, wheat]

def basic_ingredients(recipe_id)
  Ingredient.find_or_create_by({ name: 'water', percentage: 100, recipe_id: recipe_id });
  Ingredient.find_or_create_by({ name: 'AP flour', percentage: 30, recipe_id: recipe_id, flour: true});
  Ingredient.find_or_create_by({ name: 'bread flour', percentage: 70, recipe_id: recipe_id, flour: true});
  Ingredient.find_or_create_by({ name: 'salt', percentage: 2, recipe_id: recipe_id });
  Ingredient.find_or_create_by({ name: 'yeast', percentage: 5, recipe_id: recipe_id });
end

recipes.each do |recipe|
  basic_ingredients(recipe.id)
end
