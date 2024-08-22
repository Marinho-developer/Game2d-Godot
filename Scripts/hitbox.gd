extends Area2D




func _on_body_entered(body): #hitbox do player
	if body.name == "player":
		body.velocity.y = body.JUMP_FORCE
		get_parent().anim.play("hurt")
