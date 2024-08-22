extends CharacterBody2D


const SPEED = 700.0
const JUMP_VELOCITY = -400.0

@onready var wall_detector := $wall_detector as RayCast2D
@onready var texture := $texture as Sprite2D
@onready var anim = $anim as AnimationPlayer

@export var enemy_score := 100 #ponto gerado ao matar o enemy

var direction := -1

#gravidade
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")


func _physics_process(delta): #funções de colisão de gravidade do enemy
	
	if not is_on_floor():
		velocity.y += gravity * delta
		
	if wall_detector.is_colliding():
		direction *= -1
		wall_detector.scale.x *= -1
			
	if direction == 0:
		texture.flip_h = true
	else:
		texture.flip_h = false

		velocity.x = direction * SPEED * delta 
	
		
		move_and_slide()


func _on_anim_animation_finished(anim_name): #animação ao atingir o enemy
	if anim_name == "hurt":
		Globals.score += enemy_score
		queue_free()

