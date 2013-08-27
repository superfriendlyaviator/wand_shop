require_relative 'wand'
require_relative 'known_items'

class Wandshop
  attr_reader :player_wands, :wandmenu, :wand_options
  attr_accessor :player_gold
  
  def initialize
    @player_gold = 100
    @player_wands = []
    @wandmenu = {
      KnownItems::TOOTHPICK_WAND.name.downcase => KnownItems::TOOTHPICK_WAND,
      KnownItems::SPOON_WAND.name.downcase => KnownItems::SPOON_WAND
    }

    @wand_options = "Welcome to the wand shop. Please select an option.
      Press 1 to see all wands. 
      Press 2 to buy a new wand. 
      Press 3 to sell your old wand.
      Press 4 to see your wands.
      Press 5 to see your gold. 
      Press 6 to leave the wand shop." 
  end


  def see_wands 
    wandmenu.each{|name, wand| puts "#{wand.name} - #{wand.cost} gold"} 
  end

  def buy_wands 
    wandmenu.each{|name, wand| puts "#{wand.name} - #{wand.cost} gold" } 
    puts "Please select a wand from the menu." 
    user_wants = gets.chomp.downcase
    wand = wandmenu[user_wants]

    if wand
      if player_gold > wand.cost
        puts wand.description
        puts "This wand costs #{wand.cost} gold."
        player_wands.push(wand)
        self.player_gold -= wand.cost
        puts "You have #{player_gold} gold left to spend. Choose wisely."
      else 
        puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
      end
     
    else
      puts "I guess you don't wanna buy a wand after all! Bye now!"
    end 
  end

  def sell_wands 
    puts "So you want to sell your old wands? Great! You have these wands now: "
    puts player_wands 
    puts "We buy all wands for 10 gold.Tell me which one you want to chuck." 
    wand_sell = gets.chomp.downcase
    player_wands.delete(wand_sell)
    self.player_gold += 10
  end

  def show_wands 
    puts player_wands.collect{|wand| puts wand}
  end
  
  def show_gold 
    puts "You have #{player_gold} gold. Spend it wisely." 
  end 

  def leave 
    puts "Thank you for your purchase. Good luck fighting those shadow monsters!"
    exit
  end

  def get_out!
    puts "I don't know what you think you're doing here, but
          I don't like it. Get out!" 
    exit
  end

  def shop_loop
    loop do
      puts wand_options
      user_choice = gets.chomp

      case user_choice 
      when '1' then see_wands
      when '2' then buy_wands 
      when '3' then sell_wands 
      when '4' then show_wands
      when '5' then show_gold
      when '6' then leave
      else get_out!
      end 
    end 
  end

end

wandshop = Wandshop.new
wandshop.shop_loop

