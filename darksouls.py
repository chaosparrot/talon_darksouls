from talon import Module, actions
from talon.experimental.locate import locate_hover

mod = Module()
mod.mode("darksouls", "Mode to silo in all our ds commands and keep other non-ds commands out")
mod.mode("talking", desc="Mode for talking without words being recognized")

shift_up = False
heavy_attack_start = 0
heavy_attack = False

@mod.action_class
class Actions:

    def switch_to_darksouls():
        """Switches to the Dark souls game and switches the modes around"""
        #actions.user.switch_hud_theme("darksouls")
        actions.mode.enable("user.darksouls")
        actions.mode.disable("command")
        locate_hover("user/darksoulsicon.png")
        #actions.user.switcher_focus("OBS Studio")
        #actions.key("ctrl-shift-6")
        actions.user.hummingbird2_stop()
        actions.user.hummingbird2_clear()
        actions.user.hummingbird2_set("wasd", "primary")
        actions.user.hud_add_status_icon("state", "state_moving")
        actions.user.hummingbird2_set_current_slot("primary")
        actions.mouse_click(0)
        actions.mouse_move(1920 / 2, 1080 / 2)   

    def switch_to_talking():
        """Switch to the talking mode"""
        actions.mode.disable("user.darksouls")
        actions.sleep(0.1)
        actions.user.hud_add_status_icon("talking", "state_talking")
        actions.mode.enable("user.talking")
        actions.sleep(1)
        actions.user.disable_hud_id("event_log")
            
    def switch_from_talking():
        """Switch back to the darksouls mode"""
        actions.mode.disable("user.talking")
        actions.user.enable_hud_id("event_log")
        actions.user.hud_remove_status_icon("talking")
        actions.mode.enable("user.darksouls")
        actions.sleep(0.1)        
        
    def toggle_shift(with_message: bool = True):
        """Toggles the shift key according to the state we are currently in"""
        global shift_up
        shift_up = not shift_up
        
        if shift_up:
            if with_message:
                actions.user.add_noise_log("Shift down", "Zh")
            actions.user.hud_add_status_icon("shift", "shift_down")
            actions.key("shift:down")
        else:
            if with_message:
                actions.user.add_noise_log("Shift release", "Zh")
            actions.user.hud_remove_status_icon("shift")
            actions.key("shift:up")

    def heavy_attack_start(ts: float):
        """Starts the countdown before a heavy attack"""
        global heavy_attack_start
        heavy_attack_start = ts
        
    def heavy_attack(ts: float):
        """Toggles the shift key according to the state we are currently in"""
        global heavy_attack, heavy_attack_start, shift_up
        if (heavy_attack == False and ts - heavy_attack_start > 0.2):
            if not shift_up:
                actions.user.toggle_shift(False)
                
            heavy_attack = True
            actions.key("p:down")
            actions.user.add_noise_log("Charge attack!", "Zh")
            
    def heavy_attack_release():
        """Releases the heavy attack"""
        global heavy_attack, shift_up
        if heavy_attack:
            heavy_attack = False
            actions.key("p:up")
            if shift_up:
                actions.user.toggle_shift(False)
        
    def escape_darksouls():
        """Switches the command mode back on"""
        actions.user.hummingbird2_stop()
        actions.user.hummingbird2_clear()
        actions.user.hummingbird2_set_current_slot("primary")
        actions.user.hummingbird2_stop()
        actions.user.hummingbird2_clear()
        
        # Make sure the shift key is no longer pressed when switching back to normal
        global shift_up
        if shift_up: 
            actions.user.toggle_shift(False)
        
        actions.user.hud_remove_status_icon("state")
        #actions.user.switch_hud_theme("light")
        actions.mode.enable("command")
        actions.mode.disable("user.darksouls")
        actions.user.hud_remove_ability("movement")
        #actions.user.switcher_focus("OBS Studio")
        #actions.sleep(0.1)
        #actions.key("ctrl-shift-8")
        actions.user.hummingbird2_set("log")        
        #actions.user.switcher_focus("Notepad++ : a free (GPL) source code editor")
        actions.key("play_pause")
