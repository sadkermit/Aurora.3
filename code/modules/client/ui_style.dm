GLOBAL_LIST_INIT(all_ui_styles, list(
	"Midnight"     = 'icons/mob/screen/midnight.dmi',
	"Orange"       = 'icons/mob/screen/orange.dmi',
	"old"          = 'icons/mob/screen/old.dmi',
	"White"        = 'icons/mob/screen/white.dmi',
	"old-noborder" = 'icons/mob/screen/old-noborder.dmi'
	))

GLOBAL_LIST_INIT(all_tooltip_styles, list(
	"Midnight", //Default for everyone is the first one,
	"Plasmafire",
	"Retro",
	"Slimecore",
	"Operative",
	"Clockwork"
	))

/proc/ui_style2icon(ui_style)
	if(ui_style in GLOB.all_ui_styles)
		return GLOB.all_ui_styles[ui_style]
	return GLOB.all_ui_styles["White"]

/client/verb/change_ui()
	set name = "Change UI"
	set category = "Preferences.Game"
	set desc = "Configure your user interface"

	if(!ishuman(usr))
		to_chat(usr, SPAN_WARNING("You must be human to use this verb."))
		return

	var/UI_style_new = input(usr, "Select a style. White is recommended for customization") as null|anything in GLOB.all_ui_styles
	if(!UI_style_new) return

	var/UI_style_alpha_new = input(usr, "Select a new alpha (transparency) parameter for your UI, between 50 and 255") as null|num
	if(!UI_style_alpha_new || !(UI_style_alpha_new <= 255 && UI_style_alpha_new >= 50)) return

	var/UI_style_color_new = input(usr, "Choose your UI color. Dark colors are not recommended!") as color|null
	if(!UI_style_color_new) return

	//update UI
	var/list/icons = usr.hud_used.adding + usr.hud_used.other + usr.hud_used.hotkeybuttons
	icons.Add(usr.zone_sel)
	icons.Add(usr.gun_setting_icon)
	icons.Add(usr.item_use_icon)
	icons.Add(usr.gun_move_icon)
	icons.Add(usr.radio_use_icon)

	var/icon/ic = GLOB.all_ui_styles[UI_style_new]

	for(var/atom/movable/screen/I in icons)
		if(I.name in list(I_HELP, I_HURT, I_DISARM, I_GRAB)) continue
		I.icon = ic
		I.color = UI_style_color_new
		I.alpha = UI_style_alpha_new


	if(alert("Like it? Save changes?",,"Yes", "No") == "Yes")
		prefs.UI_style = UI_style_new
		prefs.UI_style_alpha = UI_style_alpha_new
		prefs.UI_style_color = UI_style_color_new
		prefs.save_preferences()
		to_chat(usr, "UI was saved")
