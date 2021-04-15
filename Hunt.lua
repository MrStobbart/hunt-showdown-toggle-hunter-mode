-- Toggles a mouse button when you press another mouse button.
-- 1. Change your mouse to "Automatic Game Detection" mode
-- 2. Right click on a profile's icon and choose scripting
-- 3. Paste this into the default profile script box, save, enjoy!
activate_script_button = 6
script_activated = false

primary_toggle_button = 2
primary_letter_to_toggle = "o" -- What button to toggle
primary_letter_toggled = false

secondary_toggle_button = 4 -- What mouse button should control the toggle
secondary_letter_to_toggle = "l" -- What button to toggle
secondary_letter_toggled = false

function OnEvent(event, arg)
	-- Uncomment this to see what the number of the clicked mouse button is
	-- OutputLogMessage(arg) 

	if event == "MOUSE_BUTTON_PRESSED" then

		if arg == activate_script_button then
			script_activated = not script_activated
			secondary_letter_toggled = false
			primary_letter_toggled = false
			ReleaseKey(secondary_letter_to_toggle)
			ReleaseKey(primary_letter_to_toggle)
			OutputLogMessage("activate script %s ", tostring(script_activated))
		end

		if script_activated and arg == primary_toggle_button then
				
			if primary_letter_toggled then
				if secondary_letter_toggled then
					ReleaseKey(secondary_letter_to_toggle)
					secondary_letter_toggled = false
					Sleep(30)
				end
				ReleaseKey(primary_letter_to_toggle)
			else
				if secondary_letter_toggled == false then 
					PressKey(secondary_letter_to_toggle)
					secondary_letter_toggled = true
					Sleep(30)
				end
				PressKey(primary_letter_to_toggle)
			end
			primary_letter_toggled = not primary_letter_toggled
		end

		if script_activated and arg == secondary_toggle_button then	
			if secondary_letter_toggled then
				if primary_letter_toggled  == false then
					ReleaseKey(secondary_letter_to_toggle)
					secondary_letter_toggled = false
				end
			else
				PressKey(secondary_letter_to_toggle)
				secondary_letter_toggled = true
			end
			ReleaseKey(primary_letter_to_toggle)
			primary_letter_toggled = false
		end
	end
end
