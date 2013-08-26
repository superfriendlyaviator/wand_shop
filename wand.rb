class Wand 
  attr_accessor :name, :cost, :description, :power_level

  def initialize(name, cost, power_level)
    @name = name 
    @cost = cost 
    @description = description 
    @power_level = power_level
  end

  def describe
    puts "Enter your description of this wand: "
    @description = gets.chomp 
  end 

  def description
    puts @description
  end
end

