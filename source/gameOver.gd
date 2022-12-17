extends Control

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

func _physics_process(delta):
	spawn_obstacle()

func spawn_obstacle():
	# Get a random obstacle from list
	var obstacle = load(obstacles[rand_range(0, obstacles.size())]).instance()
	
	# Select random position
	$spawnLine/spawnPoint.unit_offset = rand_range(0.0, 1.0)
	
	# Spawn	
	$spawns.add_child(obstacle)
	obstacle.global_position = $spawnLine/spawnPoint.global_position
	obstacle.rotation_degrees = rand_range(-40.0, 40.0)

func _on_title_pressed():
	Globals.goto_scene(Globals.title_scene)

func _on_restart_pressed():
	Globals.goto_scene(Globals.main_scene)
