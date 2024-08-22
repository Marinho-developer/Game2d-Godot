extends Node2D

@onready var player := $player as CharacterBody2D
@onready var camera := $camera as Camera2D
@onready var control = $hud/control

func _ready(): #funções de camera, tela de game over e informações que o player inicia
	player.follow_camera(camera)
	player.player_has_died.connect(game_over)
	Globals.coins = 0
	Globals.score = 0
	Globals.player_life = 3


func _process(delta: float) -> void:
	pass
	
func reload_game(): #funções de reiniciar o game
	await get_tree().create_timer(1.0).timeout
	get_tree().reload_current_scene()

func game_over(): #chamada para a tela de game over
	get_tree().change_scene_to_file("res://prefabs/game_over.tscn")

