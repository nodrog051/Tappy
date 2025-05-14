extends Control

const GAME_OVER = preload("res://assets/audio/game_over.wav")
@onready var game_over_label: Label = $GameOverLabel
@onready var press_space_label: Label = $PressSpaceLabel
@onready var timer: Timer = $Timer
@onready var score_label: Label = $MarginContainer/ScoreLabel
@onready var sound: AudioStreamPlayer2D = $Sound

var _score: int = 0

func _ready() -> void:
	_score = 0
	
func on_point_scored() -> void:
	_score += 1
	score_label.text = "%04d" % _score
	sound.play()
	
	
	
func _unhandled_input(event: InputEvent) -> void:
	if event.is_action_pressed("Exit") == true:
		print(event)
		GameManager.load_main_scene()
	elif press_space_label.visible == true and event.is_action_pressed("jump"):
		ScoreManager.high_score = _score
		GameManager.load_main_scene()
		
# Called when the node enters the scene tree for the first time.
func _enter_tree() -> void:
	SignalHub.on_point_scored.connect(on_point_scored)
	SignalHub.on_plane_died.connect(on_plane_died)
	
func on_plane_died() -> void:
	sound.stop()
	sound.stream = GAME_OVER       
	sound.play() 
	game_over_label.show()
	timer.start()

func _on_timer_timeout() -> void:
	game_over_label.hide()
	press_space_label.show()

	#GameManager.load_main_scene()
	
