require_relative 'view'
require_relative 'recipe'
require 'nokogiri'
require 'open-uri'

class Controller
  def initialize(cookbook)
    @cookbook = cookbook
    @view = View.new
  end

  def list
    display_all
  end

  def create
    # get the name from the user
    name = @view.ask_user_for("name")
    # get the description from the user
    description = @view.ask_user_for("description")
    # create Recipe instance
    recipe = Recipe.new(name, description)
    # save the Recipe instance
    @cookbook.add_recipe(recipe)
  end

  def destroy
    # list all recipes
    display_all
    # prompt the user for the instance to destroy
    recipe_index = @view.ask_user_for_index
    # delete that instance
    @cookbook.remove_recipe(recipe_index)
  end

  def import_recipe
    ingredient = @view.which_ingredient?
    url = "http://www.letscookfrench.com/recipes/find-recipe.aspx?s=#{ingredient}"
    html_file = open(url).read
    html_doc = Nokogiri::HTML(html_file)
    recipe_name_array =[]
    html_doc.search('.m_contenu_resultat').first(5).map do |element|
    title = element.search(".m_titre_resultat").text.strip
    prep_time = element.search(".m_detail_time").text.strip
    recipe_text = element.search(".m_texte_resultat").text.strip
    difficulty = element.search(".m_detail_recette").text.strip
    recipe_name_array << Recipe.new(title, recipe_text, prep_time, difficulty)
    end
    puts "these are your options"

    @view.display(recipe_name_array)
    recipe_index = @view.which_recipe?
    @cookbook.add_recipe(recipe_name_array[recipe_index])

    end
    def mark_a_recipe
       display_all
       index = @view.which_recipe?
       @cookbook.change_recipe(index)


      end

  private

  def display_all
    recipes = @cookbook.all
    @view.display(recipes)
  end



end

