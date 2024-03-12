extends Node2D

@onready var car_player = $CarPlayer
@onready var left_boundary_marker = $LeftBoundaryMarker
@onready var right_boundary_marker = $RightBoundaryMarker

# Called when the node enters the scene tree for the first time.
func _ready():
	car_player.posx_left_boundary = left_boundary_marker.position.x
	car_player.posx_right_boundary = right_boundary_marker.position.x
	
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass
