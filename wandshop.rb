require_relative 'wand'
require_relative 'wizard'


player_gold = 100
player_wands = []
wandmenu = {:Toothpick_Wand=> 2, :Spoon_Wand=>5, :Practice_Wand => 10, :Paper_Cut_Out=> 25, :Vorpal_Wand=> 75, :Lightsaber_Wand=> 200} 
            
wand_options = "Welcome to the wand shop. Please select an option.
Press 1 to see all wands. 
Press 2 to buy a new wand. 
Press 3 to sell your old wand.
Press 4 to see your wands.
Say 'leave' to leave the wand shop." 


puts wand_options
user_choice = gets.chomp
until user_choice == 'leave'



case user_choice 
when "1"
  puts wandmenu.each{|wand, price| puts "#{wand} - #{price}"} 
  puts wand_options
  user_choice = gets.chomp

when "2" 
  puts wandmenu.each{|wand, price| puts "#{wand} - #{price}"} 
    puts "Please select a wand from the menu." 
    user_wants = gets.chomp.downcase 
    case user_wants 
    
    when "toothpick wand"
        if player_gold > wandmenu[:Toothpick_Wand]
          print "Ah, the mighty Toothpick Wand! Watch out! It's sharp! It's yours for only "
          print wandmenu[:Toothpick_Wand]
          print " crystals!" 
          player_wands.push(:Toothpick_Wand)
          player_gold -= wandmenu[:Toothpick_Wand]
          puts "You have #{player_gold} gold left to spend. Choose wisely."
        puts wand_options
        user_choice = gets.chomp
        else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
        end
        
    when "spoon wand"
        if player_gold > wandmenu[:Spoon_Wand]
          puts "Ah, the silvery slurpperery Spoon Wand! Once you're done slaying shadow monsters you can go have a nice spot of stew! It's yours for only "
          print wandmenu[:Spoon_Wand] 
          print " crystals!" 
          player_wands.push(:Spoon_Wand)
          player_gold -= wandmenu[:Spoon_Wand]
          puts "You have #{player_gold} gold left to spend. Choose wisely."
          puts wand_options
          user_choice = gets.chomp
       else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
        
    when "practice wand" 
        if player_gold > wandmenu[:Practice_Wand]
          print "Oh...the uh...Practice Wand...At least it' sturdy! It's yours for only "
          print wandmenu[:Practice_Wand]
          print " crystals!" 
          player_wands.push(:Practice_Wand)
          player_gold -= wandmenu[:Practice_Wand]
          puts "You have #{player_gold} gold left to spend. Choose wisely."
          puts wand_options
          user_choice = gets.chomp
        else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
        
    when "paper cut out" 
         if player_gold > wandmenu[:Paper_Cut_Out]
        print "Ah, the flimsy paper cut out wand! It's yours for only "
        print wandmenu[:Paper_Cut_Out]
        print " crystals!" 
        player_wands.push(:Paper_Cut_Out)
        player_gold -= wandmenu[:Paper_Cut_Out]
        puts "You have #{player_gold} gold left to spend. Choose wisely."
        puts wand_options
        user_choice = gets.chomp
        else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
        
   
   when 'vorpal wand'
        if player_gold > wandmenu[:Spoon_Wand]
          puts 
          'One, two! One, two! And through and through
          The vorpal blade went snicker-snack!
          He left it dead, and with its head
          He went galumphing back.' 
          puts wandmenu[:Vorpal_Wand]
          print " crystals!" 
          player_wands.push(:Vorpal_Wand)
          player_gold -= wandmenu[:Vorpal_Wand]
          puts "You have #{player_gold} gold left to spend. Choose wisely."
          puts wand_options
          user_choice = gets.chomp
        else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
        
    when 'lightsaber wand'
        if player_gold > wandmenu[:Spoon_Wand]
          puts "Your father's light saber. This is the weapon of a Jedi Knight. Not as clumsy or random as a blaster, an elegant weapon for a more civilized age."
          puts wandmenu[:Lightsaber_Wand]
          print ' crystals!'
          player_wands.push(:Lightsaber_Wand)
          player_gold -= wandmenu[:Lightsaber_Sword]
          puts 'You have #{player_gold} gold left to spend. Choose wisely.'
          puts wand_options 
          user_choice = gets.chomp
        else 
          puts "I'm sorry, but you can't afford that wand yet. Go battle more shadow monsters!"
          puts wand_options
          user_choice = gets.chomp
   
    else
        puts "I guess you don't wanna buy a wand after all! Bye now!" 
              user_choice = 'leave'
    end 
    
    

when "3" 
  puts "So you want to sell your old wands? Great! You have these wands now: "
  puts player_wands 
  puts "Tell me which one you want to chuck." 
  wand_sell = gets.chomp.downcase
  case wand_sell 
    when 'toothpick wand'
    when 'spoon wand'
    when 'practice wand' 
    when 'paper cut out'
    when 'vorpal wand' 
    when 'lightsaber wand'
    
  
  puts wand_options
  user_choice = gets.chomp 
  
when '4'
  puts player_wands.collect{|wand| puts wand}
  puts wand_options
  user_choice = gets.chomp

when "leave" 
  puts "Thanks for you purchase and good luck fighting those    
       shadow monsters! Bye!" 
else 
  puts "I don't know what you think you're doing here, but
        I don't like it. Get out!" 
        user_choice = 'leave'
end 


end

