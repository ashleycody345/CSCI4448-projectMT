# CSCI4448-projectMT

"Project: Mystery Tactics" - strategy video game prototype made using Godot game engine and GDScript 

Created by Ashley Cody and Olivia Newton

---

Design patterns:
- 1) Observer pattern: Much of the logic of the game should be handled by the objects in the game without worrying about how they are represented graphically in the game's interface. For the purposes of monitoring, displaying, and eventually animating actions and events in the game, we should use observers to notify them when something happens (a character takes damage, a fight begins, etc.)
- 2) Factory pattern: Our characters take many different forms, as there are many roles that characters can fill. Fighters that specialize in physical combat, mages that use magic attacks, clerics that can heal targets, and defenders with high defensive stats are all possible to create. To reduce coupling with the constructors for each of these unique types of character, we use the factory design pattern when creating instances of these objects in a scene.
- 3) Command pattern: Our code needs to be flexible to handle both automatic computer generated inputs, and player generated inputs. As a result, we intend to use the command design pattern to handle user input and direct it to our objects to ensure versatility and reliability

Classes and interfaces: found in /project-mystery-tactics/scripts/[script_name].gd
- character class in character.gd (used as a base for player and computer controlled characters, inheriting and using polymorphism to repurpose methods based on character type)
- - character classes currently use polymorphism in their _init() functions to change their stats based on set properties

Tests: located in /project-mystery-tactics/tests/
- automated test scenes with enemy characters on separate teams, located in /project-mystery-tactics/tests/scenes
- test cases run against these scenes, located in /project-mystery-tactics/tests/scripts

Credit to Atomic Realm Assets on [itch.io](https://atomicrealm.itch.io/) for [foreground and background tileset assets](https://atomicrealm.itch.io/mini-dungeon-tileset)
