win.title: /DARK SOULS/
mode: user.darksouls
-
settings():
    key_wait = 16

# Menuing
menu up: key("up")
menu down: key("down")
menu left: key("left")
menu right: key("right")
menu open:
    key("esc")
	user.hummingbird2_set("menu", "secondary")
	user.hummingbird2_set_current_slot("secondary")
	user.hud_add_status_icon("state", "state_menu")
	
menu (exit|close):
    key("esc")
	user.hummingbird2_set_current_slot("primary")
	user.hud_add_status_icon("state", "state_moving")

confirm: key("e")
cancel: 
    key("q")
tab (next|right): key("shift-right")
tab (last|left): key("shift-left")
^character creation name <user.text>$: 
    result = user.formatted_text(text, "NOOP")
    insert(result)
    key("enter")
^name clear$:
    key("ctrl-a")
	key("backspace")

^(focus editor|escape dark souls)$: 
    user.escape_darksouls()

# Toggle lock on
parrot(low_whistle):
    key(q)
	user.hummingbird2_set_current_slot("primary")
    user.add_noise_log("Targeting", "_whistle")
	user.hud_add_status_icon("state", "state_moving")

# Camera mode	
parrot(high_whistle):
	user.hummingbird2_set("ijkl", "secondary")
	user.hummingbird2_set_current_slot("secondary")
	user.hud_add_status_icon("state", "state_camera")
    user.add_noise_log("Camera mode", "^whistle")

# Movement toggles
parrot(hiss):
	user.hummingbird2_continuous("primary")
	user.hummingbird2_up(ts, "start", "primary")
	user.add_noise_log("Move", "hiss")	
# TODO MAYBE IN LAST DIRECTION GIVEN INSTEAD OF FORWARD?

parrot(oo):
    key(e)
	user.add_noise_log("Use", "oo")

# Healing
parrot(kh):
    key(r)
	user.add_noise_log("Heal", "KH")

parrot(x):
    key(esc)
    user.hummingbird2_clear()
    user.hummingbird2_set("menu", "secondary")
	user.hummingbird2_set_current_slot("secondary")
	user.hud_add_status_icon("state", "state_menu")
	user.add_noise_log("Menu", "x")
	
# F = Two handed	
	
parrot(fff):
	user.hummingbird2_set_current_slot("primary")
	user.hud_add_status_icon("state", "state_moving")	
	user.hummingbird2_stop()
	user.hummingbird2_clear()
	
	# Extra clear of the forward button 
	# There seems to be a bug when the focus is on the secondary hummingbird
	key("w:up")
	user.add_noise_log("Stand still", "f")
parrot(oh):
    user.hummingbird2_clear("horizontal", "primary")
	user.hummingbird2_up(ts, "start", "primary")
	user.add_noise_log("Forward", "oh")
parrot(ae):
    user.hummingbird2_clear("vertical", "primary")
    user.add_noise_log("Strafe", "ae")

parrot(palate_click:stop):
	user.add_noise_log("Chat mode", "palate")
    user.switch_to_talking()
	
parrot(darksouls_ah):
    key(space:down)
	user.add_noise_log("Space", "ah")
parrot(darksouls_ah:stop):
    key(space:up)

# Attacking
parrot(cluck):
	user.add_noise_log("Attack!", "cluck")
    key(p)
parrot(laser):
	user.add_noise_log("Defend", "LAZOR")
    key(o:down)
parrot(laser:stop):
    key(o:up)
parrot(generator):
    user.toggle_shift()
	user.heavy_attack_start(ts)
parrot(generator:repeat):
    user.heavy_attack(ts)
parrot(generator:stop):
    user.heavy_attack_release()

# Up
parrot(darksouls_ee):
	user.hummingbird2_up(ts, "start")
parrot(darksouls_ee:repeat):
	user.hummingbird2_up(ts, "repeat")
parrot(darksouls_ee:stop):
	user.hummingbird2_up(ts, "stop")
	
# Left
parrot(lll):
	user.hummingbird2_left(ts, "start")
parrot(lll:repeat):
	user.hummingbird2_left(ts, "repeat")
parrot(lll:stop):
	user.hummingbird2_left(ts, "stop")

# Down
parrot(hmm):
	user.hummingbird2_down(ts, "start")
parrot(hmm:repeat):
	user.hummingbird2_down(ts, "repeat")
parrot(hmm:stop):
	user.hummingbird2_down(ts, "stop")

# Right
parrot(hurr):
	user.hummingbird2_right(ts, "start")
parrot(hurr:repeat):
	user.hummingbird2_right(ts, "repeat")
parrot(hurr:stop):
	user.hummingbird2_right(ts, "stop")

# M - Sneaking
# Shift - Heavy attacks etc.
# Character movement: WASD
# Left alt - walking
# Space - Dashing and rolling
# Space - Jumping
# IJKL - Camera movement
# Camera movement: mouse position - Might test this out with eyetracker
# Arrow keys: Does some equipment switching - Menuing