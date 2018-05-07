require 'csv'
require_relative 'recipe'

class Cookbook
  def initialize(filepath)
    @recipes = []
    @filepath = filepath
    load_csv
  end

  def all
    @recipes
  end

  def add_recipe(recipe)
    @recipes << recipe
    update_csv
  end

  def remove_recipe(recipe_index)
    @recipes.delete_at(recipe_index)
    update_csv
  end

  def change_recipe(index)
  @recipes[index+1].mark_recipe
  end

  private

  def load_csv
    CSV.foreach(@filepath) { |row| @recipes << Recipe.new(row[0], row[1]) }
  end

  def update_csv
    CSV.open(@filepath, "w") do |csv|
      @recipes.each do |recipe|
        csv << [recipe.name, recipe.description]
      end
    end
  end
end
