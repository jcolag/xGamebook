defmodule Character do
  defstruct id: 0, name: "Person", boss: false, power: 0
end

defmodule Location do
  defstruct id: 0, name: "Place", parent: 0
end

defmodule Item do
  defstruct id: 0, name: "Thing"
end

defmodule Drop do
  defstruct character: 0, item: 0, chance: 0, state: 0, once: false
end

defmodule State do
  defstruct id: 0, name: "State"
end

defmodule Transition do
  defstruct id: 0, state_to: 0, state_from: 0
end

defmodule CondLocation do
  defstruct id: 0, state: 0, location: 0, conj_group: 0
end

defmodule CondDefeat do
  defstruct id: 0, state: 0, character: 0, conj_group: 0
end

defmodule CondInventory do
  defstruct id: 0, state: 0, item: 0, conj_group: 0
end

defmodule TellStory do
  %Location{id: 1, name: "Player's Office", parent: 0}
  %Location{id: 2, name: "Evil Lair's Bathroom", parent: 6}
  %Location{id: 3, name: "Evil Lair's Command Center", parent: 6}
  %Location{id: 4, name: "Evil Lair's Barracks", parent: 6}
  %Location{id: 5, name: "Evil Lair's Hangar", parent: 6}
  %Location{id: 6, name: "Outside the Evil Lair", parent: 0}

  %Character{id: 1, name: "Henchman"}
  %Character{id: 2, name: "Villain"}

  %Drop{character: 2, item: 1, chance: 100, state: 2, once: true}
  %Drop{character: 2, item: 2, chance: 100, state: 0, once: true}
  %Drop{character: 1, item: 3, chance: 100, state: 4, once: true}

  %Item{id: 1, name: "Armor"}
  %Item{id: 2, name: "PDA"}
  %Item{id: 3, name: "Key"}

  %State{id: 1, name: "Mission Accepted"}
  %State{id: 2, name: "Armor Acquired"}
  %State{id: 3, name: "PDA Acquired"}
  %State{id: 4, name: "Key Acquired"}
  %State{id: 5, name: "Missile Disarmed"}

  %Transition{id: 1, state_to: 1, state_from: 0}
  %Transition{id: 2, state_to: 2, state_from: 1}
  %Transition{id: 3, state_to: 3, state_from: 1}
  %Transition{id: 4, state_to: 3, state_from: 2}
  %Transition{id: 5, state_to: 4, state_from: 1}
  %Transition{id: 6, state_to: 4, state_from: 2}
  %Transition{id: 7, state_to: 4, state_from: 3}
  %Transition{id: 8, state_to: 5, state_from: 3}
  %Transition{id: 8, state_to: 5, state_from: 4}

  %CondLocation{id: 1, state: 1, location: 1, conj_group: 1}
  %CondLocation{id: 2, state: 2, location: 2, conj_group: 2}
  %CondLocation{id: 3, state: 3, location: 2, conj_group: 3}
  %CondLocation{id: 4, state: 3, location: 3, conj_group: 4}
  %CondLocation{id: 5, state: 4, location: 4, conj_group: 5}
  %CondLocation{id: 6, state: 5, location: 5, conj_group: 6}
  %CondLocation{id: 7, state: 3, location: 3, conj_group: 7}
  %CondLocation{id: 8, state: 4, location: 4, conj_group: 8}

  %CondDefeat{id: 1, state: 2, character: 2, conj_group: 2}
  %CondDefeat{id: 2, state: 3, character: 2, conj_group: 3}
  %CondDefeat{id: 3, state: 4, character: 1, conj_group: 5}
  %CondDefeat{id: 4, state: 5, character: 1, conj_group: 6}

  %CondInventory{id: 1, state: 4, item: 1, conj_group: 8}
  %CondInventory{id: 2, state: 5, item: 2, conj_group: 6}
  %CondInventory{id: 3, state: 5, item: 3, conj_group: 6}

end

