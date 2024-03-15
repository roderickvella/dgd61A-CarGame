extends EnemyCar

var tween: Tween

# Called when the node enters the scene tree for the first time.
func _ready():
	super._ready() #call ready method in base class
	set_vechile_type(POLICE)
	start_lane_change()

func start_lane_change():
	#animate police vechiles (change lanes)
	tween = get_tree().create_tween().set_loops()
	var tween_speed = 3
	if(lane_selected == 1):
		tween.tween_interval(tween_speed)
		tween.tween_property(self,"position:x",lane_two_posx,0.5)
		tween.tween_interval(tween_speed)
		tween.tween_property(self,"position:x",lane_one_posx,0.5)
	elif(lane_selected == 2):
		tween.tween_interval(tween_speed)
		tween.tween_property(self,"position:x",lane_one_posx,0.5)
		tween.tween_interval(tween_speed)
		tween.tween_property(self,"position:x",lane_two_posx,0.5)


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	super._process(delta)
	


func _on_area_2d_area_entered(area):
	hit.emit(self) #emit base signal
