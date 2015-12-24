defmodule TellStory
#*Location[ID, Name, Parent]
#[1, Player's Office, nil]
#[2, Evil Lair's Bathroom, 6]
#[3, Evil Lair's Command Center, 6]
#[4, Evil Lair's Barracks, 6]
#[5, Evil Lair's Hangar, 6]
#[6, Outside the Evil Lair, nil]
#
#*Character[ID, Name, Stats, Is Boss]
#[1, Henchman]
#[2, Villain]
#
#*Character Drops[Character ID, Item ID, Chance, State, Once]
#[2, 1, 100, 2, true]
#[2, 2, 100, nil, true]
#[1, 3, 100, 4, true]
#
#*Items[ID, Name]
#[1, Armor]
#[2, PDA]
#[3, Key]
#
#*States[ID, Name]
#[1, Mission Accepted]
#[2, Armor Acquired]
#[3, PDA Acquired]
#[4, Key Acquired]
#[5, Missile Disarmed]
#
#*Transitions[ID, State To, State From]
#[1, 1, nil]
#[2, 2, 1]
#[3, 3, 1]
#[4, 3, 2]
#[5, 4, 1]
#[6, 4, 2]
#[7, 4, 3]
#[8, 5, 3]
#[8, 5, 4]
#
#*Location Conditions[ID, State, Location, Conjunction Group]
#[1, 1, 1, 1]
#[2, 2, 2, 2]
#[3, 3, 2, 3]
#[4, 3, 3, 4]
#[5, 4, 4, 5]
#[6, 5, 5, 6]
#[7, 3, 3, 7]
#[8, 4, 4, 8]
#
#*Defeat Conditions[ID, State, Character, Conjunction Subgroup]
#[1, 2, 2, 2]
#[2, 3, 2, 3]
#[3, 4, 1, 5]
#[4, 5, 1, 6]
#
#*Inventory Conditions[ID, State, Object, Conjunction Subgroup]
#[1, 4, 1, 8]
#[2, 5, 2, 6]
#[3, 5, 3, 6]

end

