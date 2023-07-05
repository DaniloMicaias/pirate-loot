extends Area2D

var potion = 1
var player_health = 3


signal change_life(player_health)
	
func _ready():
	$redpotion.play("idle")
#coneccao com a barra de vida
	connect("change_life", get_parent().get_node("HUD/HBoxContainer/holder"), "on_change_life")
	#connect("change_life", get_parent().get_node("Player"), "on_change_life")
	
#recebe o nivel de vida atual do player 
func on_change_life(player_health_2):
	player_health = player_health_2
	#print("change life = %d" %player_health)
	
	
func _on_items_body_entered(body):	
	player_health += 1
	#print("body entered = %d" %player_health)
#sinal com a barra de vida
	emit_signal("change_life", player_health)
	$drinkAudio.play()
	$redpotion.play("collected")
	Global.potion += potion
	
func _on_redpotion_animation_finished():
	if $redpotion.animation == "collected":
		queue_free()
