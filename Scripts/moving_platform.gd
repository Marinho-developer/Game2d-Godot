extends Node2D

const WAIT_DURATION := 1.0

@onready var platform := $platform as AnimatableBody2D
@export var move_speed := 3.0
@export var distance := 192
@export var move_horizontal := true

var follow := Vector2.ZERO
var platform_center := 16
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	move_platform()
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	platform_position = platform.position.lerp(follow, 0.5)
	pass
	
func move_platform():
		var move_direction = Vector2.RIGHT * distance if move_horizontal else Vector2.UP * distance
		var duration = move_direction.length() / float(move_speed * platform_center)
		
		var platform_tween = create_tween()
		platform.tween.tween_property(self, "follow", move_direction, duration)
		platform.tween.tween_property(self, "follow", Vector2.ZERO, duration)
