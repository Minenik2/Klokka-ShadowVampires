extends CanvasLayer

var page = 0
var interact_key = "interact" # The key for interaction, usually set to "E" or "Enter"
var timer = Timer.new()

func _physics_process(_delta):
	if Input.is_action_just_pressed(interact_key) && visible == true && page == 0:
		$PanelContainer/MarginContainer/VBoxContainer/Label.text = "Hello"
		page = page + 1
		add_child(timer)
		timer.wait_time = 1.0
		timer.one_shot = true
		timer.start()

		await timer.timeout
		#visible = false
	if Input.is_action_just_pressed(interact_key) && visible == true && page == 1:
		page = page + 1
		$PanelContainer/MarginContainer/VBoxContainer/Label.text = "it's me"
		timer.start()
		await timer.timeout
	if Input.is_action_just_pressed(interact_key) && visible == true && page == 2:
		visible = false
