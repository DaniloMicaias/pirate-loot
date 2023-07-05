extends Area2D

var potion = 1
var player_health = 3

func _ready():
	$redpotion.play("idle")

func _on_items_body_entered(body):	
	player_health += 1
	$drinkAudio.play()
	$redpotion.play("collected")
	Global.potion += potion
	print(Global.potion) 
	
func _on_redpotion_animation_finished():
	if $redpotion.animation == "collected":
		queue_free()
