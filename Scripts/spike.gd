extends Area2D

@onready var collision = $collision
@onready var spikes = $spikes


func _ready(): #colisão dos spikes
	collision.shape.size = spikes.get_rect().size


func _on_body_entered(body): #O que acontece quando o player colide com o spike
	if body.name == "player" && body.has_method("take_damage"):
		body.take_damage(Vector2(0,-250))
		
