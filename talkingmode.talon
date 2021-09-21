mode: user.talking
-
<phrase>: skip()
parrot(palate_click:stop):
    user.switch_from_talking()
    user.add_noise_log("Enable controls", "palate")