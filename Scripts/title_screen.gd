extends Control



func _ready():
	pass 



func _process(delta):
	pass


func _on_start_pressed(): #botão start
	get_tree().change_scene_to_file("res://Levels/world_01.tscn")


func _on_credits_pressed():
	pass 


func _on_quit_pressed(): #Botão quit
	get_tree().quit()
