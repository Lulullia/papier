extends Node2D

var obstacles = [
	"res://obstacles/boulePapier.tscn",
	"res://obstacles/cocotte.tscn",
	"res://obstacles/beignets.tscn",
	"res://obstacles/gourde.tscn",
	"res://obstacles/lunettesnono.tscn",
	"res://obstacles/berrad.tscn",
	"res://obstacles/coucourhita.tscn",
	"res://obstacles/saramanelou.tscn",
	"res://obstacles/tajine.tscn",
	"res://obstacles/siwak.tscn",
	"res://obstacles/3ds.tscn",
	"res://obstacles/cartouche.tscn",
	"res://obstacles/khabia.tscn",
	"res://obstacles/khabia2.tscn",
	"res://obstacles/gomme.tscn",
	"res://obstacles/casque.tscn",
	"res://obstacles/lunettesnassera.tscn",
	"res://obstacles/sandale.tscn"
]

onready var spawn_point = get_node("game/spawnLine/spawnPoint")

func _ready():
	$countdown.playing = true

func start():
	$countdown.visible = false
	$ColorRect.visible = false
	$countdown.playing = false
	$game/avion.activate()
	$game/souffleur.activate()

func _on_limite_body_entered(body):
	if body.name == "avion":
		$game/souffleur.deactivate()
		$game/avion.activated = false
		yield(get_tree().create_timer(1.0), "timeout")
		Globals.goto_scene(Globals.gameover_scene)

func _on_souffleur_souffle_now(souffle, pos):
	var s = souffle.instance()
	$game/souffles.add_child(s)
	s.position = pos
	s.start()


func _on_Timer_timeout():
	if !$ColorRect.visible:
		spawn_obstacle()

func spawn_obstacle():
	# Get a random obstacle from list
	var obstacle = load(obstacles[rand_range(0, obstacles.size())]).instance()
	
	# Select random position
	spawn_point.unit_offset = rand_range(0.0, 1.0)
	
	# Spawn	
	$game/obstacles.add_child(obstacle)
	obstacle.global_position = spawn_point.global_position
	obstacle.rotation_degrees = rand_range(-40.0, 40.0)

func _on_pause_toggled(button_pressed):
	if button_pressed:
		get_tree().paused = true
	else:
		get_tree().paused = false


func _on_avion_out_of_bounds():
	if $game/avion.is_active():
		$game/avion.global_position = $game/avionRespawn.global_position
