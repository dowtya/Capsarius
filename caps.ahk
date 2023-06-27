; @author Alec (Primary); Frank ; Lazzy
; This script was written primarily by (Alec) with the help of Lazzy and Vifts who helped when I got snagged


; This is a legacy caps script that was written for the sole intention of farming caps overnight, using the
; overloads you can fit, it should also pick up pure essence (when the stack gets high enough)

; Set your loot value above XXX gp, this will make sure it loots only the noted items and keys and not the food
; which is important so your inventory does not fill up with unneccessary items when using the script


; How to set it up:
	; Have 5 capsarius in your small PSD room
	; Make sure legacy combat is enabled
	; Stand in the spot you will see in standhere.png
	; Gear recommended can be found at gear.png
	; Begin the script with F1, making sure your loot window is open
	; F2 will exit the script, otherwise it will kill itself when you run out of overload

; What it does:

	; Picks up the keys via custom area loot when detected
	; Clicks on Notepaper in inventory, then clicks on the key picked up via image search
	; Detects and clicks aggro overloads via image detection
	; Clicks on Shard



SetTimer, Shard, 305000 ; 5 mins
SetTimer, Ovl, 360000 ; 6 mins
global ovl := 6 ; increment for which to search for
global key := 1 ; increment for searching through the keys


f1:: ; Start Script
	SetTimer, task, 1000
	Return


f2:: ; Exit Script
	ExitApp
	Return



Shard: ; Method for the shard
	
	clickHelper(shard.png)
	Return
	
	


task: ; Method for searching for the keys and calling notekeys

	if (key = 1) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 primus.png
		if (ErrorLevel) {
			key := 2
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(primus.png)
			key := 1
		}

	}
	if (key = 2) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 secundus.png
		if (ErrorLevel) {
			key := 3
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(secundus.png)
			key := 1
		}

	}

	if (key = 3) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 tertius.png
		if (ErrorLevel) {
			key := 4
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(tertius.png)
			key := 1
		}

	}

	if (key = 4) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 quartus.png
		if (ErrorLevel) {
			key := 5
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(quartus.png)
			key := 1
		}

	}

	if (key = 5) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 quintus.png
		if (ErrorLevel) {
			key := 6
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(quintus.png)
			key := 1
		}

	}

	if (key = 6) {

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 sextus.png
		if (ErrorLevel) {
			key := 1
		} else {
			ControlSend, ,{space},RuneScape ; loot the key 
			notekeys(sextus.png)
			key := 1
		}

	}
	
	Return






Ovl: ; Method for ovl
	
	if (ovl = 6) {
	
		clickHelper(ovl6dose.png)
		ovl := 5

	} else if (ovl = 5) {
		
		clickHelper(ovl5dose.png)
		ovl := 4
		
	} else if (ovl = 4) {
		
		clickHelper(ovl4dose.png)
		ovl := 3
		
	} else if (ovl = 3) {
		
		clickHelper(ovl3dose.png)
		ovl := 2
		
	} else if (ovl = 2) {
		
		clickHelper(ovl2dose.png)
		ovl := 1
		
	} else if (ovl = 1) {
		
		clickHelper(ovl1dose.png)
		ovl := 6
		
	}
	
	
	Return
	
	
	
	

; Method for noting the keys
notekeys(png) {

	ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 notepaper.png

	if (ErrorLevel) {

	} else {
		Ay := Ay - 24
		Ay := Ay - ran(1,3)
		Ax := Ax - ran(1,3)
		ControlClick, ,RuneScape, , , , x%Ax% y%Ay%
		Sleep, % ran(600, 700)

		ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 keys\%png%
		if (ErrorLevel) {

		} else {
			Ay := Ay - 24
			Ay := Ay - ran(1,3)
			Ax := Ax - ran(1,3)
			ControlClick, ,RuneScape, , , , x%Ax% y%Ay%
			Sleep, % ran(600, 700)
		}
	}
}
	
	
	
; Method for ovl clicking	
clickHelper(png) {

	ImageSearch, Ax, Ay, 0, 0, A_ScreenWidth, A_Screenheight, *40 overloads\%png%
	
	if (ErrorLevel) {
	
	} else {
		Ay := Ay - 24
		Ay := Ay - ran(1,3)
		Ax := Ax - ran(1,3)
		ControlClick, ,RuneScape, , , , x%Ax% y%Ay%
		Sleep, % ran(600, 700)
		Return
	}
}


	
	
