extends Node


# Called when the node enters the scene tree for the first time.
func _ready():
	# Application ID
	DiscordRPC.app_id = 1312865972419559464
	# this is boolean if everything worked
	print("Discord working: " + str(DiscordRPC.get_is_discord_working()))
	# Set the first custom text row of the activity here
	DiscordRPC.details = "Смотрит на звезды..."
	# Set the second custom text row of the activity here
	# DiscordRPC.state = "Checkpoint 23/23"
	# Image key for small image from "Art Assets" from the Discord Developer website
	DiscordRPC.large_image = "froggie_pfp"
	# Tooltip text for the large image
	DiscordRPC.large_image_text = "Присоединяйся!"
	# Image key for large image from "Art Assets" from the Discord Developer website
	DiscordRPC.small_image = "cursor_3_"
	# Tooltip text for the small image
	DiscordRPC.small_image_text = "Тут что-то было("
	# "02:41 elapsed" timestamp for the activity
	DiscordRPC.start_timestamp = int(Time.get_unix_time_from_system())
	# "59:59 remaining" timestamp for the activity
	DiscordRPC.end_timestamp = int(Time.get_unix_time_from_system()) + 3600
	# Always refresh after changing the values!
	DiscordRPC.refresh() 


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass
