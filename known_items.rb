require_relative 'wand'

class KnownItems

  # KnownItems.items_by_name

  # known_items = KnownItems.new
  # known_items.items_by_name
  # other_items = KnownItems.new('blah')
  # other_items.items_by_name
  # if known_items.items_by_name == other_items.items_by_name
  #   make_it_a_class_method
  # else
  #  make_it_an_instance_method
  # end

  TOOTHPICK_WAND = Wand.new('Toothpick Wand', 10, "A small little thing.")
  SPOON_WAND = Wand.new('Spoon Wand', 15, "Who uses a spoon?")
  PRACTICE_WAND = Wand.new('Practice Wand', 25, "Oh...the uh...Practice Wand...At least it' sturdy!")
  PAPER_CUT_OUT = Wand.new('Paper Cut Out', 50, "Ah, the flimsy paper cut out wand!")
  VORPAL_WAND = Wand.new('Vorpal Wand', 75,  "One, two! One, two! And through and through
The vorpal blade went snicker-snack!
He left it dead, and with its head
He went galumphing back.")
  LIGHTSABER_WAND = Wand.new('Lightsaber Wand', 200, "Your father's light saber. This is the weapon of a Jedi Knight. Not as clumsy or random as a blaster, an elegant weapon for a more civilized age.")

  ALL = [TOOTHPICK_WAND, SPOON_WAND, PAPER_CUT_OUT, PRACTICE_WAND, VORPAL_WAND, LIGHTSABER_WAND]
  
  def self.items_by_name
    items = {}
    KnownItems::ALL.each do |item|
      items[item.name.downcase] = item
    end
    items
  end

end
