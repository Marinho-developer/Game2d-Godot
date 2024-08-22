extends CanvasLayer

@onready var resume_btn = $menu_holder/resume_btn



func _ready():
	visible = false



func _process(delta):
	pass


func _unhandled_input(event): #função para aparecer a tela de pause ao pressionar ESC
	if event.is_action_pressed("ui_cancel"):
		visible = true
		get_tree().paused = true
		resume_btn.grab_focus()

func _on_resume_btn_pressed(): #função do botão resume
		get_tree().paused = false
		visible = false


func _on_quit_btn_pressed(): #função do botão quit
	get_tree().quit()
