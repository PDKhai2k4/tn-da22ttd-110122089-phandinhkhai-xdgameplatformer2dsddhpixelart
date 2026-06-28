extends Label

var pulse_time := 0.0
var last_second := -1

@onready var warning_sound = $"../WarningSound"


func _process(delta):

	text = GameManager.format_time(GameManager.level_time)

	var time_left = GameManager.level_time

	# Bình thường
	if time_left > 30:

		modulate = Color.WHITE
		scale = Vector2.ONE

	# Cảnh báo nhẹ
	elif time_left > 10:

		modulate = Color.YELLOW
		scale = Vector2.ONE

	# Nguy hiểm
	else:

		modulate = Color.RED

		# Hiệu ứng đập tim
		pulse_time += delta

		var s = 1.0 + 0.25 * abs(sin(pulse_time * 6))

		scale = Vector2(s, s)

		# Bíp mỗi giây
		var current_second = int(time_left)

		if current_second != last_second:

			last_second = current_second

			if warning_sound:
				warning_sound.play()
 
