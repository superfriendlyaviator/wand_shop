class Wandshop
  attr_reader :player_wands, :wandmenu, :wand_options
  attr_accessor :player_gold
  
  def initialize
    @player_gold = 100
    @player_wands = []
    @wandmenu = {
      :Toothpick_Wand => 2,
      :Spoon_Wand => 5,
      :Practice_Wand => 10,
      :Paper_Cut_Out => 25,
      :Vorpal_Wand => 75,
      :Lightsaber_Wand => 200
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
    puts wandmenu.each{|wand, price| puts "#{wand} - #{price}"} 
  end

  def buy_wands 
   puts wandmenu.each{|wand, price| puts "#{wand} - #{price}"} 
      puts "Please select a wand from the menu." 
      user_wants = gets.chomp.downcase 
      case user_wants 
      
      when "toothpick wand"
          if player_gold > wandmenu[:Toothpick_Wand]
            print "Ah, the mighty Toothpick Wand! Watch out! It's sharp! It's yours for only "
            print wandmenu[:Toothpick_Wand]
            print " gold!" 
            player_wands.push(:Toothpick_Wand)
            puts "PLAYER GOLD: #{player_gold}"
            puts "WANDMENU: #{wandmenu[:Toothpick_Wand]}"
            self.player_gold -= wandmenu[:Toothpick_Wand]
            puts "You have #{player_gold} gold left to spend. Choose wisely."
          else 
            puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          end
          
      when "spoon wand"
          if player_gold > wandmenu[:Spoon_Wand]
            puts "Ah, the silvery slurpperery Spoon Wand! Once you're done slaying shadow monsters you can go have a nice spot of stew! It's yours for only "
            print wandmenu[:Spoon_Wand] 
            print " gold!" 
            player_wands.push(:Spoon_Wand)
            self.player_gold -= wandmenu[:Spoon_Wand]
            puts "You have #{player_gold} gold left to spend. Choose wisely."
         else 
            puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
         end
          
      when "practice wand" 
          if player_gold > wandmenu[:Practice_Wand]
            print "Oh...the uh...Practice Wand...At least it' sturdy! It's yours for only "
            print wandmenu[:Practice_Wand]
            print " gold!" 
            player_wands.push(:Practice_Wand)
            self.player_gold -= wandmenu[:Practice_Wand]
            puts "You have #{player_gold} gold left to spend. Choose wisely."
          else 
            puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
           end
            
      when "paper cut out" 
           if player_gold > wandmenu[:Paper_Cut_Out]
          print "Ah, the flimsy paper cut out wand! It's yours for only "
          print wandmenu[:Paper_Cut_Out]
          print " gold!" 
          player_wands.push(:Paper_Cut_Out)
          self.player_gold -= wandmenu[:Paper_Cut_Out]
          puts "You have #{player_gold} gold left to spend. Choose wisely."
          else 
            puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          end
          
     
     when 'vorpal wand'
          if player_gold > wandmenu[:Vorpal_Wand]
            puts 'One, two! One, two! And through and through
            The vorpal blade went snicker-snack!
            He left it dead, and with its head
            He went galumphing back.' 
            print wandmenu[:Vorpal_Wand]
            print " gold!" 
            player_wands.push(:Vorpal_Wand)
            self.player_gold -= wandmenu[:Vorpal_Wand]
            puts "You have #{player_gold} gold left to spend. Choose wisely."
          else 
            puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          end
          
      when 'lightsaber wand'
          if player_gold > wandmenu[:Lightsaber_Wand]
            puts "Your father's light saber. This is the weapon of a Jedi Knight. Not as clumsy or random as a blaster, an elegant weapon for a more civilized age."
            puts wandmenu[:Lightsaber_Wand]
            print ' crystals!'
            player_wands.push(:Lightsaber_Wand)
            self.player_gold -= wandmenu[:Lightsaber_Wand]
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

