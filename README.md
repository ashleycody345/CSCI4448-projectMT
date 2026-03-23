# CSCI4448-projectMT

"Project: Mystery Tactics" - strategy video game prototype made using Godot game engine and GDScript 

Created by Ashley Cody and Olivia Newton

---

Design patterns:
- 1) Observer pattern: Much of the logic of the game should be handled by the objects in the game without worrying about how they are represented graphically in the game's interface. For the purposes of monitoring, displaying, and eventually animating actions and events in the game, we should use observers to notify them when something happens (a character takes damage, a fight begins, etc.)
- 2) pattern 2
- 3) pattern 3

Classes and interfaces: found in /project-mystery-tactics/scripts/[script_name].gd
- character class in character.gd (used as a base for player and computer controlled characters, inheriting and using polymorphism to repurpose methods based on character type)
- - character classes currently use polymorphism in their _ready() functions to change their stats based on set properties

Tests: located in /project-mystery-tactics/tests/
- automated test scenes with enemy characters on separate teams, located in /project-mystery-tactics/tests/scenes
- test cases run against these scenes, located in /project-mystery-tactics/tests/scripts

Credit to Atomic Realm Assets on [itch.io](https://atomicrealm.itch.io/) for [foreground and background tileset assets](https://atomicrealm.itch.io/mini-dungeon-tileset)