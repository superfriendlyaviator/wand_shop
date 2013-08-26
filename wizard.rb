class Wizard 
  attr_reader :name
  attr_accessor :gold, :level
  
  def initialize(name, gold=10, level=1)
    @name = name
    @gold = gold 
    @level = level
    end

  def gold_bag(gold)
    
    
  def buy(amount)
      @gold -= amount
  end

end

