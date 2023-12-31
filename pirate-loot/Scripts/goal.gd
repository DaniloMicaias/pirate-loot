extends Area2D

onready var changer = get_parent().get_node("Transition_in")

export var path : String

func _ready():
	$goal.play("idle")
	

func _on_goal_body_entered(body):
	if body.name == "Player":
		$goal.play("collected")
		changer.change_scene(path)
		MusicController.stop_level1_music()
		MusicController.play_level2_music()
		
