# xGamebook

Prototype "gamebook" (choose-your-own-adventure) implementation.

## Overview

Every once in a while, I have a quick idea for a project that requires some sort of narrative with user input that isn't quite [Interactive Fiction](https://en.wikipedia.org/wiki/Interactive_fiction) (where I would probably just use [Inform 7](http://inform7.com/) to try it out), but also isn't something I can envision as [Hypertext fiction](https://en.wikipedia.org/wiki/Hypertext_fiction).  What can I say?  I spent a lot of formative years playing tabletop roleplaying games and still have some ideas rattling around my skull.

Speaking of games, I wouldn't be surprised to find this eventually married to something like [AC-Resolve](https://github.com/jcolag/AC-Resolve) in the future.

## Sample Adventure

When I initially looked at this problem (without code), I put together a very simple story to determine what data was needed to make the story play out.

> We want to stop a supervillain from launching his nuclear missile.  To do this, we need the secret code and the key.  The key is carried by the lead henchman and the code is on the villain's PDA.  The villain wears a suit of armor that can be used to trick henchmen for a brief period.  The villain also may need to go to the bathroom, leaving him vulnerable.  And someone needs to inform us of the mission, before getting started.

It's straightforward, contrived, and uninteresting, but it served as a solid basis to work out most of the ideas and should be representative of most adventure-type stories.  So, it will be used to test _xGamebook_.

## Adventure Analysis

Given the sample adventure above, the states need to include:

 1.  Mission Accepted
 1.  Armor Acquired; can follow 1
 1.  PDA Acquired (mutually exclusive with 5); can follow 1 or 2
 1.  Key Acquired (mutually exclusive with 4); can follow 1, 2, or 3
 1.  Missile Disarmed; can follow 3 or 4

There are conditions blocking some states:

 1.  State 2 requires fighting the villain when he's vulnerable
 1.  State 3 requires a theft or Condition 1
 1.  State 4 requires fighting the henchman or wearing the armor
 1.  State 5 requires holding the PDA and Key and fighting the henchman

In addition, several states must occur in specific locations.

 1.  State 1 occurs in the player's office
 1.  State 2 occurs outside the evil lair's bathroom
 1.  State 3 occurs outside the evil lair's bathroom or the evil lair's command center
 1.  State 4 occurs in the evil lair's barracks
 1.  State 5 occurs in the evil lair's hangar

That turns up several types of conditions.  Each condition, which may be duplicated for different states, needs a state and an optional "conjunction index," identifying which other conditions must go with it.

We have different kinds of conditions:
 - Location Visited
 - Defeat Someone
 - Inventory Containing Something
 - States Achieved

And, of course, there are locations in the story.

 -  Player's Office
 -  Evil Lair's Bathroom
 -  Evil Lair's Command Center
 -  Evil Lair's Barracks
 -  Evil Lair's Hangar

That should be just about everything needed to play except states that "unlock" new locations, and that will become the sample data for _xGamebook_.


