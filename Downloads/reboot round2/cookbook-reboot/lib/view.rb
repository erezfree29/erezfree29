class View
  def display(recipes)
    x=''
    recipes.each_with_index do |recipe, index|
      if recipe.is_marked?
        x = 'x'
      end
      puts "[#{x}]-#{index + 1}- #{recipe.name}: #{recipe.description} :#{recipe.difficulty} :#{recipe.prep_time}"
    end

  end
  def ask_user_for(input)
    puts "Specify #{input}"
    gets.chomp
  end

  def ask_user_for_index
    puts "Specify index"
    gets.chomp.to_i - 1
  end
  def which_ingredient?
    puts "enter ingredient you would like to search"
    gets.chomp
  end
  def which_recipe?
    puts "which choose a recipe to add by entering an index"
    gets.chomp.to_i
  end
end
