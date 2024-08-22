extends Area2D

@onready var coin_collect = $coin_collect as AudioStreamPlayer

var coins := 1

func _ready():
	pass # Replace with function body.



func _process(delta: float) -> void:
	pass

func _on_body_entered(body: Node2D) -> void: #função de coletar e deletar a moeda
	$anim.play("collect")
	coin_collect.play()
	await $collision.call_deferred("queue_free")
	Globals.coins += coins

	
func _on_anim_animation_finished() -> void: #deleta a moeda ao concluir a animação
	queue_free()
