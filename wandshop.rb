require_relative 'wand'
require_relative 'known_items'

class Wandshop
  attr_reader :player_wands, :wandmenu, :wand_options
  attr_accessor :player_gold
  
  def initialize
    @player_gold = 100
    @player_wands = [KnownItems::TOOTHPICK_WAND, KnownItems::SPOON_WAND, KnownItems::PAPER_CUT_OUT]
    @wandmenu = KnownItems.items_by_name
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
        puts "It's yours for only #{wand.cost} gold."
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
    if player_wands.empty?
      puts "You don't have any wands to sell!"
      return
    end
    
    puts "So you want to sell your old wands? Great! You have these wands now: "
    player_wands.each_with_index{|wand, index| puts "#{index+1} - #{wand.name}"}
    puts "We buy all wands for half their value. Tell me which one you want to chuck:" 
    wand_sell_index = gets.chomp.to_i

    if wand_sell_index > 0 && wand_sell_index <= player_wands.length
      sold_wand = player_wands.delete_at(wand_sell_index-1)
      self.player_gold += sold_wand.resale_value
      puts "Thanks for selling the #{sold_wand.name} for #{sold_wand.resale_value} gold! You now have #{player_gold} gold!"
    else
      puts "If you are just going to play around, I'm going to have to ask you to leave."    
    end
  end

  def show_wands
    puts "You currently own:"
    player_wands.each{|wand| puts wand.name}
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

