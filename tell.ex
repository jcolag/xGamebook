defmodule Player do
  defstruct location: 0, state: 0
end

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

defmodule Travel do
  defstruct id: 0, location: 0
end

defmodule TellStory do
  defp init() do
    l1 = %Location{id: 1, name: "Player's Office", parent: 0}
    l2 = %Location{id: 2, name: "Evil Lair's Bathroom", parent: 6}
    l3 = %Location{id: 3, name: "Evil Lair's Command Center", parent: 6}
    l4 = %Location{id: 4, name: "Evil Lair's Barracks", parent: 6}
    l5 = %Location{id: 5, name: "Evil Lair's Hangar", parent: 6}
    l6 = %Location{id: 6, name: "Outside the Evil Lair", parent: 0}
    l = [l1, l2, l3, l4, l5, l6]

    c1 = %Character{id: 1, name: "Henchman"}
    c2 = %Character{id: 2, name: "Villain"}
    c = [c1, c2]

    i1 = %Item{id: 1, name: "Armor"}
    i2 = %Item{id: 2, name: "PDA"}
    i3 = %Item{id: 3, name: "Key"}
    i = [i1, i2, i3]

    d1 = %Drop{character: 2, item: 1, chance: 100, state: 2, once: true}
    d2 = %Drop{character: 2, item: 2, chance: 100, state: 0, once: true}
    d3 = %Drop{character: 1, item: 3, chance: 100, state: 4, once: true}
    d = [d1, d2, d3]

    s1 = %State{id: 1, name: "Mission Accepted"}
    s2 = %State{id: 2, name: "Armor Acquired"}
    s3 = %State{id: 3, name: "PDA Acquired"}
    s4 = %State{id: 4, name: "Key Acquired"}
    s5 = %State{id: 5, name: "Missile Disarmed"}
    s = [s1, s2, s3, s4, s5]

    t1 = %Transition{id: 1, state_to: 1, state_from: 0}
    t2 = %Transition{id: 2, state_to: 2, state_from: 1}
    t3 = %Transition{id: 3, state_to: 3, state_from: 1}
    t4 = %Transition{id: 4, state_to: 3, state_from: 2}
    t5 = %Transition{id: 5, state_to: 4, state_from: 1}
    t6 = %Transition{id: 6, state_to: 4, state_from: 2}
    t7 = %Transition{id: 7, state_to: 4, state_from: 3}
    t8 = %Transition{id: 8, state_to: 5, state_from: 3}
    t9 = %Transition{id: 8, state_to: 5, state_from: 4}
    t = [t1, t2, t3, t4, t5, t6, t7, t8, t9]

    cl1 = %CondLocation{id: 1, state: 1, location: 1, conj_group: 1}
    cl2 = %CondLocation{id: 2, state: 2, location: 2, conj_group: 2}
    cl3 = %CondLocation{id: 3, state: 3, location: 2, conj_group: 3}
    cl4 = %CondLocation{id: 4, state: 3, location: 3, conj_group: 4}
    cl5 = %CondLocation{id: 5, state: 4, location: 4, conj_group: 5}
    cl6 = %CondLocation{id: 6, state: 5, location: 5, conj_group: 6}
    cl7 = %CondLocation{id: 7, state: 3, location: 3, conj_group: 7}
    cl8 = %CondLocation{id: 8, state: 4, location: 4, conj_group: 8}
    cl = [cl1, cl2, cl3, cl4, cl5, cl6, cl7, cl8]

    cd1 = %CondDefeat{id: 1, state: 2, character: 2, conj_group: 2}
    cd2 = %CondDefeat{id: 2, state: 3, character: 2, conj_group: 3}
    cd3 = %CondDefeat{id: 3, state: 4, character: 1, conj_group: 5}
    cd4 = %CondDefeat{id: 4, state: 5, character: 1, conj_group: 6}
    cd = [cd1, cd2, cd3, cd4]

    ci1 = %CondInventory{id: 1, state: 4, item: 1, conj_group: 8}
    ci2 = %CondInventory{id: 2, state: 5, item: 2, conj_group: 6}
    ci3 = %CondInventory{id: 3, state: 5, item: 3, conj_group: 6}
    ci = [ci1, ci2, ci3]
    
    [l, c, i, d, s, t, cl, cd, ci]
  end
  
  defp byIndex([], _) do
    nil
  end
  
  defp byIndex([head|tail], id) do
    if head.id == id do
      head
    else
      byIndex(tail, id)
    end
  end
  
  defp findNeighborLocations([], _) do
    []
  end
  
  defp findNeighborLocations([head|tail], id) do
    cond do
      head.parent == id ->
        [head|findNeighborLocations(tail, id)]
      true ->
        findNeighborLocations(tail, id)
    end
  end
  
  defp enumerateItems([], _) do
    []
  end
  
  defp enumerateItems([head|tail], counter) do
    IO.puts "  (" <> Integer.to_string(counter) <> ")  " <> head.name
    travel = %Travel{id: counter, location: head.id}
    [travel|enumerateItems(tail, counter + 1)]
  end
  
  defp where(locations, player) do
    locId = player.location
    loc = byIndex(locations, locId)
    unless loc == nil do
      IO.puts "You are in:  " <> loc.name
    end
    nlocs = findNeighborLocations(locations, locId)
    unless locId == 0 do
      out = %Location{id: loc.parent, name: "Out", parent: -1}
      nlocs = [out|nlocs]
    end
    IO.puts "You can travel to:"
    map = enumerateItems(nlocs, 1)
    resp = IO.gets "Where to? "
    {idx, extra} = Integer.parse(resp)
    player = %Player{location: byIndex(map, idx).location, state: player.state}
    where(locations, player)
  end

  def play(startLoc, startState) do
    player = %Player{location: startLoc, state: startState}
    inv = []
    [locations, characters, items, drops, states, transitions, cnLocations, cnDrops, cnInventory] = init()
    where(locations, player)
  end
end

TellStory.play(1, 0)

