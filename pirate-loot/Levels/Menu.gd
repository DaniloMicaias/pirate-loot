extends Control

func _ready():
	$Controls/start.grab_focus()

func _on_start_pressed():
	get_tree().change_scene("res://Levels/Level_03.tscn")


func _on_controls_pressed():
	get_tree().change_scene("res://Scenes/controlsScreen.tscn")

func _on_quit_pressed():
	get_tree().quit()
