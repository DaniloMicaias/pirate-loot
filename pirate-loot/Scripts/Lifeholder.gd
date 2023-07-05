extends Control

var life_size = 32
	

# Declare member variables here. Examples:
# var a = 2
# var b = "text"


# Called when the node enters the scene tree for the first time.
func on_change_life(player_health):
	if player_health == 0:
		print("Foi de arrasta pra cima")
	else:	
		if player_health == 2:
			print(player_health)
			$life3.hide();
		elif player_health == 1:
			print(player_health)
			$life2.hide();
		elif player_health == 0:
			print(player_health)
			$life1.hide();

#$live.rect_size.x = player_health * life_size

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
