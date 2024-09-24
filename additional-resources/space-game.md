In this exercise, you will implement a variant of the Civilization unguided exercise ([Chapter 7] (http://rmod-pharo-mooc.lille.inria.fr/AdvancedDesignMooc/2024-04-01-CompanionExercise.pdf) of the companion exercise).

The model and rules are a bit different...

## General Rules

* Our game board is now the universe, composed of regions. It is still a grid of tiles, a tile contains a region and may contain a fleet of space ships.
* Units are space ships of a given type, with a hull and shields
* Units are contained in fleets
* A fleet contains at least one space ship
* Fleets in neighbor regions can attack each other and provoke a space battle by moving on an occupied region.
* The attacker is the fleet moving to an occupied region, and the defender is the fleet occupying the region
* If the defender fleet is destroyed, the attacker fleet moves into the region it attacked
* If the attacker fleet is destroyed, the defender stays in place
* If neither of the fleets are destroyed, the defender stays in place and the attacker goes back to its original region of space

## Combat rules

Combat happens when a fleet attacks another and provokes a space battle.
A battle is composed of three rounds, each round happens as follows:
    
* The attacker fires at the defender and the defender fires back to the attacker

* Damage is counted and applied on each fleet

* If one of the fleet is destroyed, the battle ends

### Damage to a fleet

To apply damage, ships are randomly sorted and damage is applied to them following that order:
* Damage is calculated by cumulating the damage of all the firing fleet's ships
* Damage is applied to the first ship in the list by substracting the total damage from that ship's shields,
* If the shields of the ship fall below zero, the remaining damage is substracted from the ship's hull,
* If the hull of the ship falls below zero, the ship is destroyed, removed from the fleet, and the remaining damage is applied to the second ship in the same manner,
* etc.

**Example:**
Let us imagine that we have two fleets, F1 and F2. 
F1 is composed of two battlecruisers (shields=200, hull=1000). 
F2 is composed of three cruisers (shields=50, hull=150).
To illustrate simply the calculation, we will use example damage, hull and shield numbers.

F1 attacks F2.
Following combat rules, the battles rages on:

*Round 1*

F1 fires at F2 and F2 fires back:
* F1 damage: 500
* F2 damage: 350

F1 takes damage:
* Random ordered ships: battlecruiser_1 , battlecruiser_2 
* battlecruiser_1 takes damages to shields: `shields = 200 - 350 = - 150`. 
Shields are destroyed
* battlecruiser_1 takes damages to hull: `hull = 1000 - 150 = 850`

F2 takes damage:
* Random ordered ships: cruiser_3, cruiser_ 1, cruiser_2 
* cruiser_3 takes damages to shields: `shields = 50 - 500 = - 450`. 
Shields are destroyed
* cruiser_3 takes damages to hull: `hull = 150 - 450 = - 300`. cruiser_3 is destroyed
* cruiser_1 takes damages to shields: `shields = 50 - 300 = - 250`. 
Shields are destroyed
* cruiser_1 takes damages to hull: `hull = 150 - 250 = - 100`. cruiser_1 is destroyed
* cruiser_2 takes damages to shields: `shields = 50 - 100 = - 50`. 
Shields are destroyed
* cruiser_2 takes damages to hull: `hull = 150 - 50 =  100`. 

*Round 2*

F1 fires at F2 and F2 fires back:
* F1 damage: 500
* F2 damage: 117 (the damage is lower than in the first round, since we lost two cruisers)

F1 takes damage:
* Random ordered ships: battlecruiser_1 , battlecruiser_2 
* battlecruiser_1 takes damages to shields but shields are down.
* battlecruiser_1 takes damages to hull: `hull = 850 - 117 = 733`

F2 takes damage:
* Random ordered ships: cruiser_2
* cruiser_2 takes damages to shields but shields are down.
* cruiser_2 takes damages to hull: `hull = 100 - 500 =  - 400`. cruiser_1 is destroyed

The battle ends as the defending fleet has been destroyed.

## Defending Fleet Damage Formula


## Attacking Fleet Damage Formula

## Ships
We consider the following ships: fighter, cruiser, destroyer, and battle cruiser.

### Fighter
Small ship designed to harass bigger ships.
Extremely weak allow, but beware of the swarm.
- Shields : 100
- Hull: 400
- Damage: 50

Fighter shields are sensible to high radiation from deep space.
When in deep space, their shield is set to 0.
Because they are close-combat ships they have increased precision in nebulas.
When fighting in nebulas, other ships take double damage from fighters.
However, their weapons cannot penetrate destroyers and battle cruisers shields.

### Cruiser
Everything is in the name.
Medium-sized battleship.

- Shields : 1000
- Hull: 8000
- Damage: 400

Cruisers shields are state of the art technology. 
They are not affected by deep space radiation.
Their targeting sensors are also of top quality and do not lose precision when fighting in nebulas.

### Destroyer

Deadly warships equipped for one-to-one combat with other ships.

- Shields : 5000
- Hull: 10000
- Damage: 2000

Destroyer shields are divided by 2 in deep space, due to elevated radiation levels.
Their precision sensors always inflict 100% damage.
However, they are ship-killers, and have specialized weaponry: they inflict double damage on shields and half damage on hulls.

### Battle Cruiser
Heavy warship. Just good in battle in any region of space.

- Shields : 12000
- Hull: 6000
- Damage: 1000


## Regions of space

## Tests

