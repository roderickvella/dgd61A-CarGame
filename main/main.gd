extends Node2D

@onready var car_player = $CarPlayer
@onready var left_boundary_marker = $LeftBoundaryMarker
@onready var right_boundary_marker = $RightBoundaryMarker

const CIVILIAN_CAR = preload("res://car_enemies/civilian_car.tscn")
const POLICE_CAR = preload("res://car_enemies/police_car.tscn")

#constants for the x positions fo the first and second lanes
const first_lane_posx:int = 225
const second_lane_posx:int = 320

# Called when the node enters the scene tree for the first time.
func _ready():
	car_player.posx_left_boundary = left_boundary_marker.position.x
	car_player.posx_right_boundary = right_boundary_marker.position.x
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_timer_timeout():
	randomize()
	var ememy_picker = randi_range(0,3)
	var ememy_instance
	if(ememy_picker == 0):
		ememy_instance = POLICE_CAR.instantiate() #create police car scene
	else:
		ememy_instance = CIVILIAN_CAR.instantiate()
	
	#set the lane positions for our enemy car
	ememy_instance.set_lane_positions(first_lane_posx,second_lane_posx)	
	
	#call on_hit_car when enemy car collides with something
	ememy_instance.hit.connect(on_hit_car)
	
	#we have to add enemy_instance to our scene	
	add_child(ememy_instance)	

func on_hit_car(enemy_car):
	#remove the player car from the scene
	car_player.queue_free()
	#remove the enemy car from the scene
	enemy_car.queue_free()
