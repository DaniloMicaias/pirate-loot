extends Area2D

onready var changer = get_parent().get_node("Transition_in")

export var path : String

func _ready():
	pass # Replace with function body.


func _on_goal_body_entered(body):
	if body.name == "Player":
		print("win")
		changer.change_scene(path)
