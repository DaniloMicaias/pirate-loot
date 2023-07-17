extends Control

func _ready():
	$Controls/start.grab_focus()
	MusicController.play_menu_music()

func _on_start_pressed():
	get_tree().change_scene("res://Levels/Level_01.tscn")
<<<<<<< HEAD
=======
	MusicController.stop_menu_music()
>>>>>>> 8ac8f457dc32555a442239339c38f08b01a8edf0


func _on_controls_pressed():
	get_tree().change_scene("res://Scenes/controlsScreen.tscn")

func _on_quit_pressed():
	get_tree().quit()
