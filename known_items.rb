require_relative 'wand'

module KnownItems
  TOOTHPICK_WAND = Wand.new('Toothpick', 2, "A small little thing.")
  SPOON_WAND = Wand.new('Spoon', 5, "Who uses a spoon?")
  
  ALL = [TOOTHPICK_WAND, SPOON_WAND]
  
    # @wandmenu = {
    #   :Toothpick_Wand => 2,
    #   :Spoon_Wand => 5,
    #   :Practice_Wand => 10,
    #   :Paper_Cut_Out => 25,
    #   :Vorpal_Wand => 75,
    #   :Lightsaber_Wand => 200
    # } 
end
