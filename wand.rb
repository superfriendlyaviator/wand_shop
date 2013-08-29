class Wand 
  attr_reader :name, :cost, :description

  def initialize(name, cost, description)
    @name = name 
    @cost = cost  
    @description = description
  end

  def resale_value
    cost / 2
  end
  
  #def attack
  #end

end


