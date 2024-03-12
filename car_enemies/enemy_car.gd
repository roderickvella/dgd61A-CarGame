class_name EnemyCar #this is a base class (civilian and police car are going to make use of this class)
extends Node2D

enum {POLICE, CIVILIAN} #enum for different types of enemy cars

var vechile_type #variable to store the type of the vechile (POLICE or CIVILIAN)
var speed:float=200.0 #speed of the car
var lane_selected:int #variable to store which lane the car is in
var lane_one_posx:int #x-coordinates position for lane one
var lane_two_posx:int #x-coordinates position for lane two

signal hit(object) #signal emitted when a hit occurs

#region Getters and Setters
func set_vechile_type(type):
	self.vechile_type = type

func get_vechile_type():
	return self.vechile_type
	
func set_lane_positions(lane_one_posx:int, lane_two_posx:int):
	self.lane_one_posx = lane_one_posx
	self.lane_two_posx = lane_two_posx

func get_lane_positions():
	return [lane_one_posx,lane_two_posx]
	
#endregion

# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	lane_selected = randi_range(1,2) #randomly select a lane
	position.y = -100 #above the screen
	position.x = lane_one_posx if lane_selected == 1 else lane_two_posx #set positionx based on selected lane

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.y += speed * delta #move the enemy car down the screen
	if(position.y > get_viewport_rect().size.y + 200): #200 is an offset to make sure the vechile is off the screen
		queue_free() #remove/destroy the car (to free memory)
	
