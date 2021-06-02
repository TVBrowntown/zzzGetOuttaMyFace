zzzGetOuttaMyFace = {}

local SoRCheck

function zzzGetOuttaMyFace.OnInit()
	RegisterEventHandler(SystemData.Events.ENTER_WORLD, "zzzGetOuttaMyFace.PetCheck")
	RegisterEventHandler(SystemData.Events.INTERFACE_RELOADED, "zzzGetOuttaMyFace.PetCheck")
	RegisterEventHandler(SystemData.Events.LOADING_END, "zzzGetOuttaMyFace.PetCheck")
	RegisterEventHandler(SystemData.Events.PLAYER_COMBAT_FLAG_UPDATED, "zzzGetOuttaMyFace.InCombat")
end

function zzzGetOuttaMyFace.ModsCheck()
    local mods = ModulesGetData();
    for k,v in ipairs(mods) do
        if v.name == "RoR_SoR" then
            if v.isEnabled then
            SoRCheck = true
            else
            SoRCheck = false
            end
            break
        end
    end
end

function zzzGetOuttaMyFace.PetCheck()
	--test thoroughly
	if GameData.Player.Pet.healthPercent == 0 or nil then
		if DoesWindowExist("EA_CareerResourceWindowActionBar") then WindowSetShowing("EA_CareerResourceWindowActionBar", false) end
	else
		WindowSetShowing("EA_CareerResourceWindowActionBar", true)
	end
end

function zzzGetOuttaMyFace.InCombat()
	if GameData.Player.inCombat == true then
			--	Hide TacticsWindow
			--	Hide MenuBar
			--	Toggle SoR if currently active
	 	if DoesWindowExist("EA_TacticsEditorContents") then WindowSetShowing("EA_TacticsEditorContents", false) end
	 	if DoesWindowExist("MenuBarWindow") then WindowSetShowing("MenuBarWindow", false) end
	 	if SoRCheck == nil then zzzGetOuttaMyFace.ModsCheck() end
	 	if SoRCheck == true then
		 	if RoR_SoR.Settings.Enabled == true then
		 		RoR_SoR.Toggle()
		 	end
		end
	 else
	 		--	Show TacticsWindow
			--	Show MenuBar
			--	Toggle SoR if currently active
	 	WindowSetShowing("EA_TacticsEditorContents", true)
	 	WindowSetShowing("MenuBarWindow", true)
	 	if SoRCheck == nil then zzzGetOuttaMyFace.ModsCheck() end
	 	if SoRCheck == true then
		 	if RoR_SoR.Settings.Enabled == false then
		 		RoR_SoR.Toggle()
		 	end
		end
	end
end