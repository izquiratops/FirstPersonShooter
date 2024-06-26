extends Node3D

@onready var player: PlayerController = $Player
@onready var pause_menu_scene = $PauseMenu
@onready var hud = $HUD

func _ready():
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

func _process(_delta):
	if Input.is_action_just_pressed("pause"):
		handle_pause()

func _physics_process(_delta):
	get_tree().call_group("Enemies", "update_target_location", player.transform.origin)

func handle_pause():
	# Stop and hide game logic
	get_tree().paused = true
	Input.set_mouse_mode(Input.MOUSE_MODE_CONFINED)
	hud.hide()

	# Show the pause menu
	pause_menu_scene.show()

func handle_resume():
	# Resume and show again the game logic
	get_tree().paused = false
	Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	hud.show()

	# Hide pause menu
	pause_menu_scene.hide()

func handle_quit():
	get_tree().quit()
