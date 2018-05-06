class Recipe
  attr_reader :name, :description ,:difficulty,:prep_time
  def initialize(name, description,difficulty = nil,prep_time =nil)
    @name = name
    @description = description
    @difficulty = difficulty
    @prep_time =prep_time
    @done =false
  end

  def mark_recipe
    @done = true
  end

  def is_marked?
    if @done
      true
    else
      false
    end
  end
end

















































# class Recipe
# 	attr_reader :name, :description
#   def initialize(name, description)
#   	@name = name
#   	@description = description
#   end

#   def name
#   	@name
#   end

#   def description
#   	@description
#   end

# end
