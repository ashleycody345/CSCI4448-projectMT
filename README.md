# CSCI4448-projectMT

"Project: Mystery Tactics" - strategy video game prototype made using Godot game engine and GDScript 

Created by Ashley Cody and Olivia Newton

---

Design patterns:
- 1
- 2
- 3

Classes and interfaces: found in /project-mystery-tactics/scripts/[script_name].gd
- character class in character.gd (used as a base for player and computer controlled characters, inheriting and using polymorphism to repurpose methods based on character type)
- - character classes currently use polymorphism in their _ready() functions to change their stats based on set properties
- game_map class in game_map.gd

Tests: located in /project-mystery-tactics/tests/
- automated test scenes with enemy characters on separate teams, located in /project-mystery-tactics/tests/scenes
- test cases run against these scenes, located in /project-mystery-tactics/tests/scripts
