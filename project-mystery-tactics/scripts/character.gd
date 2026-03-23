extends Node2D

class_name Character

const DEFAULT_HP = 100

enum Team {
	PLAYER,
	ENEMY,
	ALLY,
	NONE
}

# member variables
@export var hp: int = DEFAULT_HP
# Controls whether entity can be controlled by player or computer
@export var is_player: bool = false 	
# Controls which team a player is on: 0 = player, 1 = enemy, 2 = allied (player), 3 = no team
@export var team: Team = Team.NONE


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	pass
