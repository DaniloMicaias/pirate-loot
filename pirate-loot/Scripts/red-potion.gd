extends Area2D


func _ready():
	$redpotion.play("idle")

func _on_items_body_entered(body):	
	$drinkAudio.play()
	$redpotion.play("collected")
	
func _on_redpotion_animation_finished():
	if $redpotion.animation == "collected":
		queue_free()

