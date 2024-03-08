extends ParallaxBackground

@onready var road_layer = $RoadLayer
var scrolling_speed =50


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	road_layer.motion_offset.y += scrolling_speed*delta
