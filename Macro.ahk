﻿; heavily edited by Ryn
; card picker code from haie

#Requires AutoHotkey v2.0
#Include %A_ScriptDir%\Lib\gui.ahk
#Include %A_ScriptDir%\Lib\config.ahk
#Include %A_ScriptDir%\Lib\FindText.ahk
#Include %A_ScriptDir%\Lib\imageForCS.ahk
#Include %A_ScriptDir%\Lib\OCR-main\Lib\OCR.ahk
#Include %A_ScriptDir%\Lib\WebhookOptions.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\IsProcessElevated.ahk

global MacroStartTime := A_TickCount
global StageStartTime := A_TickCount

SendMode "Event"
RobloxWindow := "ahk_exe RobloxPlayerBeta.exe"
UnitExistence := "|<>*91$66.btzzzzzzyDzXlzzzzzzyDzXlzzzzzzyDzXlzzzyzzyDbXlUS0UM3UC1XlUA0UE30A1XlW4EXl34AMXlX0sbXXC80XVX4MbXX6A1U3UA0bk30ARk7UC0bk3UA1sDUz8bw3kC1zzbyszzzzzzzzbw1zzzzzzzzby3zzzzzzzzzzjzzzzzzU"
MaxUpgrade := "|<>*134$53.0000000007U3k00000TUDk00001XUsk000033XVU0000636300800A3M6TzwS0M3UDrjRa0k70S0AS61U40s0EMAD001U0k0Ty41331k1zwA6673k7zsQAAS7UTzkwsMQC0TzVzkk0M0Tz3zVk0kETy7z3k1VkzwTz7kX7nzzzzzzzzzzzzzzzzzzw"
MaxUpgrade2 := "|<>*146$47.D07U0001z0Tk000371lU00067z3zzzzw7w7zzzzs7kDzzzzk7UTzSzzUC0w0MwD081k0UkS00301U1w82663U3sMAAC7UDkssMwD0zVvkksQ0z3zVU0k0y7z3U1UUwDy7U33VszyDX6Dbzzzzzzzzzzzzzzzy"
MaxUpgrade3 := "|<>*91$49.Dk7s00004M3600006633000031X1U0001UP0nzr3kkD0PzynAM3UD06D3A0U70331a00301U1X20VVUs1lVUklsS1kkssMwD0kMSQAC70AA/u603036413U1UUn20Vs0ksNX0My4NqMTUDnzzlwU"
VoteStart := "|<>*95$38.ryzzzzlz7zlzwDVzwTzXszz7zsSC30Q7770E40klU410C8sklVXUACAM0w7X360T1s1kEbsz0Q40zDsTVUM"
LobbyText := "|<>*134$56.0000000000k00U10000T00y1w000Cs0RkvU003606AAM000lU1X36000AMzMwlswS36zyDwTzjslw7WD4ST6AS0M1k33lX7060A0MMPlkkVX366DwQS8sFkk3z772C4QC1zlkkV327UTw40M0k1wDz1UC0Q0z3zsQ7WD4TkzzzzzzzzwTzzzzzzzy7zzzzzzzzXzzzzzzzzszs"
AreasText := "|<>*108$36.zs007zyzztzzwTzzzzwTzTzzsA4613tA421/k4M0F3k4M4FXXUQ603bmy713zzzzzzU"
MatchmakeUI := "|<>*129$83.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzUzzzzzzzzzzzzz0zzzzzzzw7zzzw1zzzzzzzkDzzzs3zzzzzzzUTzzzs7zzzzzzz0zzzzkTzzzzzzy1zzzzzzzzzzzzw3zzzzzzzzzzzzs7zzzzzzzzzzzzkDy0Tw7UsDzzzzUTk0Ds7007zzzz0z00DUA007zzzy1w00D0M007zzzw3k00S0k00Dzzzs7U00Q1U00DzzzkC0S0s3060TzzzUQ1y0k60y0zzzz0s7w1UA1y1zzzy1kDs30M3w3zzzw3UTk60k7s7zy7k70TUA1UDkDzs70C0Q0s30TUTzk00S001k60z0zzU01w007UA1y1zz007w00D0M3w3zz00Dw00y0k7s7zz01zw03y1kDkDzzU7zy0Tw7UzkTzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs"
CaptchaExistence := "|<>*100$131.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwDzzzzzzzs3zzzzzzzzzzzkDzzzzzzz01zzzzzzy7zzzUTzzzzzzs00zzzzzzs7zzz0zzzzzzzU01zzzzzzkDzzy1zzzzzzy003zzzzzzUTzzw3zzzzzzs007zzzzzz0zzzs7zzzzzzk7wTzzzzzy1zyTkDzzzzzz0Tzz0UsEDk0DU7UEDz0Uzy1zzw01U0DU0S0300Dw01zw3zzk0300C00s0600Dk03zsDzz00600C01U0A00T007zkTzw00A00A0200M00Q00DzUzzs30M3US1w1lk70s30Tz0zzkD0kDUw3s7zUT1kD0zy1zzUz1UT1s7kTz0y3Uz1zw1zz1w30y3kDUzy1w31w3zw1zC1s61s7UT0zw3s61s7zs0sA00A00D0y0Es7kA00Dzs00A00M00y0C00kDUQ00Tzs00M00k01y0A01UT0s00zzs00s01U07w0Q030y3s01zzs03s0300zw1w0C1w7s03zzw0TwCC1rzy3y1y7wDwCDzzzzzzzw3zzzzzzzzzzzzzzzzzzzzs7zzzzzzzzzzzzzzzzzzzzkDzzzzzzzzzzzzzzzzzzzzUTzzzzzzzzzzzzzzzzzzzz0zzzzzzzzzzzzzzzzzzzzy3zzzzzzzzzzzzzzzzzzzzy7zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzU"
Matchmaking := "|<>*93$73.zzzzzzzzzzzzzzlzzzsszzzzk08zzzwATzzzs04Tzzy6Dzzzw03zzzz3zzzzy7zzzzzVzzzzz3zX4DwElW7w8U7lU3s0Mk1w0E1sk0w0AM0Q080wM0A06A06040SAC6736737W7z6D37VX3VXl3zX7VVklXkkkVzlXkk0MlsM0EzslsQ0AMwC08zwMwC06AS7U4TyATDlb6DbxXzzzzzzzzzzzlzzzzzzzzzzs0zzzzzzzzzzw0zzzzzzzzzzy0zzzzzzzzzzzty"
AutoAbility := "|<>*83$21.zzzzzzzwD4S0kXl28wS03Xk0QSH7nWMy0n7sCQzzzzU"
ClaimText := "|<>*127$71.00000000000000A7s01y000007zTs07w00000Tzlk0AQ00003k7VU0MM0000D03300kk0000Q0667zXzsw01k0AAzzzzzy031ysTrjTSyS0C7zky0AA0EQ0QCTVs0MM00Q0ss73U0kk00M1lkC711VVUUk3VnwC73333VU73zsQS666737y3tksQAAAC7zy01Uk0MMMQDzy030k0kkksTzy061U1VVVkzzz0y3kX77XXzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz"
LoadingScreen := "|<>*94$71.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzznzzzzzzzzzzy1zzzzzzzzzzs1zzzzzzzzzzk3zzzzzzzzzz03zzzzzzzzzy07zzzzzzzzzs07zzzzzzzzzk0Dzzzzzzzzz00Dzzzzzzzzy00Tzzzzzzzzs00Tzzs3zzzzk00zzy00zzzz000zzk00Tzzy001zzU00Tzzw001zy000zzzk003zw001zzzU303zk007rzy0607zU3sTjzw0S07z0DzzTzk0w0Dy0DzyzzU3w0Dw00zx"
WinterLoadingScreen := "|<>*98$87.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzwTzzzzzzzzzzzzX3zszzzzzszXzzsMTz7zzzzz7wDzz3XzszzzzzszVzzsTzz7zzzzz7wDkz3bwMz3szbszXs1sQS07U73sT7wS07XXU0w0QT7s03UkQQMA7b3Vkz00QD3XX3kzwCCDs03XwQQMz7s1llz7wQTXXX7sw0C4TszXXwQQMz73VsXz7wQD3XX3kswD0TszXk0wQQ0731w7z7wT0DXXU0s0DUzszXw3wQT17UFyDzzzzzzzzzzzzzlzzzzzzzzzzzzzgTw"
P := "|<>*88$35.3zzzy0Tzzzy0zzzzy3zzzzw7zzzzsTzzzzszzzzzlzzzzzXzw1zz7zs1zyDzk1zwTzV3zszz73zlzyC7zXzwQTz7zs0zyDzk3zwTzVzzszz7zzlzyDzzXzwTzz7zzzzyDzzzzwTzzzzszzzzzkzzzzzVzzzzy1zzzzw3zzzzk3zzzz00zzzs0000000000004"
P2 := "|<>*102$165.1zzzs000Dzzz0003zzzk000zzzw0zzzzk007zzzy001zzzzU00TzzzsDzzzz001zzzzs00Tzzzy007zzzzXzzzzw00TzzzzU07zzzzs01zzzzyTzzzzU03zzzzw00zzzzz00Dzzzzrzzzzy00zzzzzk0Dzzzzw03zzzzzzzzzzk07zw3zy01zzzzzU0Tzzzzzzzzzy00zy07zk0Dzzzzw03zlyDzzzzzzk07zU0Ty01zzzzzU0Ts30Tzzzzzy00zs01zk0Dzzzzw03y001zzz0zzk07y0k7y01zzzzzU0TU007zzvzzy00zU60Tk0Dzzzzw03w000zzzTzzk07w003y01zzzzTU0TU007zzvzzy00z000Dk0Dzzzzw03w000zzzzzzk07s0k1y01zzzzzU0TU007zzzzzy00z060Dk0Dzzzzw03y001zzzzzzk07s0k1y01zzzzzU0Tk00Dzzzzzy00z060Dk0Dzzzzw03z003zzzzzzk07s0k1y01zzzzzU0Tw00zzzzzzy00zU60Tk0Dzzzzw03zk0Dzzzzzzk07w0k3y01zzzzzU0Tz03zzzzzzy00zk60zk0Dzzzzw03zw0zzzzzzzk07z00Dy01zzzzzU0TzkDzzzzzzy00zw03zk0Dzzzzw03zzbzzzzzzzk07zk0zy01zzzzzU0Tzzzzzzzzzy00zzkzzk0Dzzzzw03zzzzzzzzzzk07zzzzy01zzzzzU0Tzzzzvzzzzw00TzzzzU07zzzzs01zzzzyTzzzzU03zzzzw00zzzzz00Dzzzzlzzzzs00Dzzzz003zzzzk00zzzzw7zzzy000zzzzk00Dzzzw003zzzz0Dzzz0001zzzs000Tzzy0007zzzUU"
Priority := "|<>*92$70.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzs0000000000T00000000000s00000000001U0000000000600000000000M007zs000001U01zwU07U0060060200m000M00E1DvuA001U017zysss0060043W110U00M00E68442001U010MXkss006004TWD1X000M00Fu8x2C001U0168XUQ8006006En/1kU00M00D1zbxy001U0000870U00600000000000M00000000001k0000000000DU0000000001zzzzzzzzzzzzU"
Spawn:="|<>*113$63.zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzw3zzzzzzzzz0Dzzzzzzzzs1zzzzzzzzz7TTzxvzizzsTk7U4QMU7z0S0M0V240zw1k1068FU3zs6C8kk0AQTzslk7701XXz7648ks0QQTs0k307V3XXz0C0Q0wMwQTy3lDl7nbXXzzyDzzzzzzzzzlzzzzzzzzzyDzzzzzzzzznzzzzzzzw"
DeathText := "|<>*100$22.zzzzUzUw3w3l7l6ASAMtstXbXaASAQFgFkAEDUlUzzzzU"

global contractsEnabled := Contracts.Value
global winterEventEnabled := WinterEvent.Value
global matchmakingEnabled := MatchmakingOrSolo.Value
global hasReconnect := 0
global sentTab := false

SetupMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    if WinExist(RobloxWindow) {
        WinActivate(RobloxWindow)
        Sleep 50
        WinMove(27, 15, 800, 600, RobloxWindow)
        Sleep 50
    }
    if WinExist("Ryns Taxi Macro") {
        Sleep 50
        WinActivate("Ryns Taxi Macro")
        Sleep 100
    }

}

InitializeMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    global MacroStartTime := A_TickCount
    global loss := 0
    global wins := 0

    if WinExist("Ryns Taxi Macro") {
        WinActivate("Ryns Taxi Macro")
    }

    if WinExist(RobloxWindow) {
        WinMove(27, 15, 800, 600, RobloxWindow)
        WinActivate(RobloxWindow)
        Sleep 100
    }
    else {
        MsgBox("You must have ROBLOX open in order to start the macro (microsoft roblox doesnt work)", "Error T4", "+0x1000",)
        return
    }

    if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
        if (!winterEventEnabled && !contractsEnabled) {
            MsgBox("You must select a gamemode before starting the macro", "Please select a game mode", "+0x1000",)
            return
        }
        GoToRaids()
    }
    else {
        MsgBox("You must be in the lobby with default camera angle to start the macro.", "Error T3", "+0x1000",)
        return
    }

}

SetDefaultKeyboard(localeID) {
    static SPI_SETDEFAULTINPUTLANG := 0x005A, SPIF_SENDWININICHANGE := 2
    Lan := DllCall("LoadKeyboardLayout", "Str", Format("{:08x}", LocaleID), "Int", 0)
    binaryLocaleID := Buffer(4, 0)
    NumPut("UInt", LocaleID, binaryLocaleID)
    DllCall("SystemParametersInfo", "UInt", SPI_SETDEFAULTINPUTLANG, "UInt", 0, "Ptr", binaryLocaleID, "UInt", SPIF_SENDWININICHANGE)
    for hwnd in WinGetList()
        PostMessage 0x50, 0, Lan, , hwnd
}

BetterClick(x, y, LR := "Left") { ; credits to yuh for this, lowk a life saver
    MouseMove(x, y)
    MouseMove(1, 0, , "R")
    MouseClick(LR, -1, 0, , , , "R")
    Sleep(50)
}

GoToRaids() {
    global sentTab
    if (sentTab = false) {
        SendInput ("{Tab}")
        sentTab := true
    }
    loop {
        ; look for contract loading screen
        if (contractsEnabled) {
            if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
                AddToLog("Found Contract Loading Screen, stopping loop")
                break
            }
        }
        if (winterEventEnabled) {
            if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, WinterLoadingScreen)) {
                AddToLog("Found Winter Event Loading Screen, stopping loop")
                break
            }
        }
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            AddToLog("Found Vote Start, stopping loop")
            break
        }
        if (ok := FindText(&X, &Y, 338, 505, 536, 572, 0, 0, ClaimText)) ; daily reward
        {
            BetterClick(406, 497)
            Sleep 3000
        }
        if (contractsEnabled = 1) {
            ; Start Contract Macro
            BetterClick(32, 400) ; click contract button
            Sleep 2000
            BetterClick(330, 280) ; click contract picture so you can scroll
            loop 4 {
                SendInput("{WheelDown}")
                Sleep 50
            }
            Sleep(150)
            if (!matchmakingEnabled) {
                BetterClick(210, 415) ; click open
                Sleep 1000
                AddToLog("Opening friends only portal")
                BetterClick(400, 350) ; click open friends
                Sleep 1000
                AddToLog("Starting solo portal")
                BetterClick(400, 468) ; click start
                Sleep 2500
            } else {
                BetterClick(310, 415) ; click matchmaking on fourth contract
            }
        }
        if (winterEventEnabled = 1) {
            ; go to winter event
            BetterClick(89, 302)
            Sleep 2000
            SendInput ("{a up}")
            ; go to teleporter
            Sleep 100
            SendInput ("{a down}")
            Sleep 6000
            SendInput ("{a up}")
            KeyWait "a" ; Wait for "d" to be fully processed
            Sleep 1200
            BetterClick(469, 340) ; play
        }
        Sleep 2000
        if (matchmakingEnabled) {
            AntiCaptcha()
        }
    }
    LoadedLoop()
    StartedLoop()
    ;OnSpawnSetup()
    TryPlacingUnits()

}

StopMacro() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    Reload()
}
; Define the rectangle coordinates
global startX := 100, startY := 500, endX := 700, endY := 350
global startY2 := 200, endY2 := 350
global step := 50 ; Step size for grid traversal
global successfulCoordinates := [] ; Array to store successful placements
global successThreshold := 3 ; Number of successful placements needed

PlaceUnit(x, y, slot := 1) {
    SendInput(slot)
    Sleep 50
    BetterClick(x, y)
    Sleep 50
    SendInput("q")

    ; Check if placement is successful
    if IsPlacementSuccessful() {
        Sleep 15
        return true
    }
    return false
}

IsPlacementSuccessful() {

    PlacementTimerSleep()

    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        AddToLog("placed unit successfully")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    else if (ok := FindText(&X, &Y, 88 - 150000, 416 - 150000, 88 + 150000, 416 + 150000, 0, 0, Priority))
    {
        AddToLog("placed unit successfully by priority")
        BetterClick(329, 184) ; close upg menu
        return true
    }
    return false
}


Numpad5:: {
    SendWebhook()
}

GetWindowCenter(WinTitle) {
    x := 0 y := 0 Width := 0 Height := 0
    WinGetPos(&X, &Y, &Width, &Height, WinTitle)

    centerX := X + (Width / 2)
    centerY := Y + (Height / 2)

    return { x: centerX, y: centerY, width: Width, height: Height }
}

rect1 := { x: 37, y: 45, width: 254, height: 69 }
rect2 := { x: 591, y: 45, width: 243, height: 47 }
rect3 := { x: 36, y: 594, width: 105, height: 51 }

isInsideRect(rect, x, y) {
    return (x >= rect.x and x <= rect.x + rect.width and y >= rect.y and y <= rect.y + rect.height)
}

; Add placement options here
TryPlacingUnits() {
    switch PlacementDropdown.Text {
        case "Spiral":
            SpiralPlacement()
        case "Lines":
            LinePlacement()
        case "Lines + 3x3 Grid Finder":
            LinePlacementGrid()
        case "Zig Zag":
            ZigZagPlacement()
        case "Zig Zag + 3x3 Grid Finder":
            ZigZagPlacement(true)
        case "Spiral + 3x3 Grid Finder":
            SpiralPlacement(true)
        default:
            AddToLog("Invalid selection")
    }
}

SpiralPlacement(gridPlacement := false) {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    centerX := GetWindowCenter(RobloxWindow).x - 30
    centerY := GetWindowCenter(RobloxWindow).y - 30
    radius := step
    direction := [[1, 0], [0, 1], [-1, 0], [0, -1]]
    dirIndex := 0
    directionCount := 0

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        currentX := centerX
        currentY := centerY
        steps := 30
        maxSteps := 5

        while (placementCount < placements) {
            for index, stepSize in [steps] {

                if PlaceUnit(currentX, currentY, slotNum) {
                    placementCount++
                    successfulCoordinates.Push({ x: currentX, y: currentY, slot: "slot_" slotNum }) ; Track successful placements
					
					try {
                        if savedPlacements.Get("slot_" slotNum) {
                            savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                        }
                    } catch {
                        savedPlacements.Set("slot_" slotNum, 1)
                    }

                    if placementCount >= placements {
                        break
                    }
		
                    if (gridPlacement) {
                        PlaceInGrid(currentX, currentY, slotNum, &placementCount, &successfulCoordinates, &
                            savedPlacements, &placements)
                    }

                }
		

                if (ok := FindText(&cardX, &cardY, 196, 204, 568, 278, 0, 0, pick_card)) {
                        cardSelector()
                }
                
				BetterClick(284, 400) ; next
				BetterClick(60, 450) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby condition.")
                    return LobbyLoop()
                }
                Reconnect()

                currentX += direction[dirIndex + 1][1] * steps
                currentY += direction[dirIndex + 1][2] * steps

                currentX += Random(-15, 15)
                currentY += Random(-15, 15)

                if isInsideRect(rect1, currentX, currentY) or isInsideRect(rect2, currentX, currentY) or isInsideRect(
                    rect3, currentX, currentY) {
                    steps := 30
                    currentX := centerX
                    currentY := centerY
                }

                if currentX > 700 or currentY > 520 or currentX <= 190 or currentY < 150 {
                    steps := 30
                    currentX := centerX
                    currentY := centerY
                }
            }

            directionCount++

            if directionCount == 2 {
                steps += 15
                directionCount := 0
            }

            dirIndex := Mod(dirIndex + 1, 4)
            if ShouldStopUpgrading(1) {
                AddToLog("Stopping due to lobby condition.")
                return LobbyLoop()
            }
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; The OG placement by @Original author of macro
LinePlacement() {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (alternatingPlacement == 0) {
                    if PlaceUnit(x, y2, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y2, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
                if (alternatingPlacement == 1) {
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements
                    }
                }
				if (ok := FindText(&cardX, &cardY, 196, 204, 568, 278, 0, 0, pick_card)) {
					cardSelector()
				}
				BetterClick(284, 400) ; next
				BetterClick(60, 450) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (Mod(alternatingPlacement, 2) == 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }
                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; Modified version of LinePlaceMent, placing in a 2x2 grid when a unit is placed,then goes back to line placing
; By @Durrenth
LinePlacementGrid() {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    x := startX ; Initialize x only once
    y := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        ; Continue placement for the current slot
        while (placementCount < placements && y >= endY && y2 <= endY2) { ; Rows
            while (placementCount < placements && x <= endX) { ; Columns
                if (alternatingPlacement == 0) {

                    if PlaceUnit(x, y2, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y2, slot: "slot_" slotNum }) ; Track successful placements

                        try {
                            if savedPlacements.Get("slot_" slotNum) {
                                savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                            }
                        } catch {
                            savedPlacements.Set("slot_" slotNum, 1)
                        }

                        if placementCount >= placements {
                            break
                        }

                        PlaceInGrid(x, y2, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &
                            placements)
                    }

                }

                if (alternatingPlacement == 1) {
                    if PlaceUnit(x, y, slotNum) {
                        placementCount++
                        successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements

                        try {
                            if savedPlacements.Get("slot_" slotNum) {
                                savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                            }
                        } catch {
                            savedPlacements.Set("slot_" slotNum, 1)
                        }

                        if placementCount >= placements {
                            break
                        }

                        PlaceInGrid(x, y2, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &
                            placements)

                    }
                }
				if (ok := FindText(&cardX, &cardY, 196, 204, 568, 278, 0, 0, pick_card)) {
					cardSelector()
				}
				BetterClick(284, 400) ; next
				BetterClick(60, 450) ; move mouse
                if ShouldStopUpgrading(1) {
                    AddToLog("Stopping due to finding lobby  condition.")
                    return LobbyLoop()
                }
                Reconnect()
                x += step - 20 ; Move to the next column
            }
            if x > endX {
                x := startX ; Reset x for the next row
                if (Mod(alternatingPlacement, 2) == 0) {
                    y2 += (step + 25) ; Move to the next row, upwards
                    alternatingPlacement += 1
                }
                else {
                    y -= (step + 25) ; Move to the next row, downwards
                    alternatingPlacement -= 1
                }
            }
            Reconnect()
        }

        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    }

    UpgradeUnits()

    AddToLog("All slot placements and upgrades completed.")
}

; Places units in a zig-zag pattern
; By @Durrenth
ZigZagPlacement(gridPlacement := false) {
    global startX, startY, endX, endY, step, successfulCoordinates, maxedCoordinates
    successfulCoordinates := [] ; Reset successfulCoordinates for each run
    maxedCoordinates := []
    savedPlacements := Map()

    startY2 := 200, endY2 := 500
    startY := 170, endY := 470

    rectZigZag := { x: startX, y: startY, width: 500, height: 500 }

    ; += Random(0, 15)

    x := startX + Random(0, 15) ; Incase 2 or more players are using the same placement, randomize starting location by 0-15 steps.
    y1 := startY ; Initialize y only once
    y2 := startY2 ; Initialize y2 only once
    y := y1 ; Start with the top Y coordinate

    ; Iterate through all slots (1 to 6)
    for slotNum in [1, 2, 3, 4, 5, 6] {
        enabled := "Enabled" slotNum
        enabled := %enabled%
        enabled := enabled.Value
        placements := "Placement" slotNum
        placements := %placements%
        placements := placements.Text

        ; Skip if the slot is not enabled
        if !(enabled = 1) {
            continue
        }

        AddToLog("Starting placements for Slot " slotNum " with " placements " placements.")

        placementCount := 0
        alternatingPlacement := 0

        while (placementCount < placements) {

            if PlaceUnit(x, y, slotNum) {
                placementCount++
                successfulCoordinates.Push({ x: x, y: y, slot: "slot_" slotNum }) ; Track successful placements
                ;AddToLog("Unit placed at x: " x ", y: " y)
                try {
                    if savedPlacements.Get("slot_" slotNum) {
                        savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                    }
                } catch {
                    savedPlacements.Set("slot_" slotNum, 1)
                }

                if placementCount >= placements {
                    break
                }

                if (gridPlacement) {
                    PlaceInGrid(x, y, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &placements)
                }

            }

 				if (ok := FindText(&cardX, &cardY, 196, 204, 568, 278, 0, 0, pick_card)) {
					cardSelector()
				}
            BetterClick(284, 400) ; next
            BetterClick(60, 450) ; move mouse
            if ShouldStopUpgrading(1) {
                AddToLog("Stopping due to finding lobby  condition.")
                return LobbyLoop()
            }
            Reconnect()

            ; Move to the next X-coordinate
            x += step
            AddToLog("x: " x ", y: " y)

            ; If X exceeds the end range, reset it and move down
            if (isInsideRect(rectZigZag, x, y)) {
                ; Alternate y between y1 and y2 for zig-zag effect
                y := (y = y1) ? y2 : y1
            } else {

                ; Incase y value goes out of bounds, re-initialize starting locations, and add a huge offset to x
                if (y >= endY) {
                    AddToLog("Reached end of Y-range or coordinates are outside rectangles. Moving to the next row.")
                    x := startX + Random(20, 40) ; Reset x to the starting position, add random offset to it incase 2 players are using same placement style
                    startY := 170
                    startY2 := 200
                    y1 := startY
                    y2 := startY2
                    y := y1
                } else { ; If y isin't OOB
                    AddToLog("Reached end of X-range or coordinates are outside rectangles. Moving to the next row.")
                    x := startX + Random(0, 15) ; Reset x to the starting position, add random offset to it incase 2 players are using same placement style
                    y1 := startY + step ; Move top Y-coordinate down
                    y2 := startY2 + step ; Move bottom Y-coordinate down
                    startY := y1 ; This is needed incase you loop again. Otherwise you will keep starting at the default startY/startY2 locations
                    startY2 := y2
                    y := y1 ; Start the new row with the top Y-coordinate
                }

            }

        } ; End While
        AddToLog("Completed " placementCount " placements for Slot " slotNum ".")
        Reconnect()
    } ; End For
    UpgradeUnits()
    AddToLog("All slot placements and upgrades completed.")
}

; Algorithm that's used in LinePlacement. Is a helper function. Attempts to place units in a 2x2 grid once an initial unit has been placed.
; Can be combined with other placement algos.
; by @Durrenth
; modified to place units in a 3x3 grid around the successful unit instead of 2x2
PlaceInGrid(startX, startY, slotNum, &placementCount, &successfulCoordinates, &savedPlacements, &placements) {
    ; Places untis in a 2x2 grid, starting from the top left where the initial unit is placed (as dictated by startX and startY)
    ; U x
    ; x x
    ;"Y"     ;"X"
    ;[number1,number2]

    gridOffsets := [
        [30, 0],  ; Row 1, Column 0
        [0, 30],  ; Row 0, Column 1
        [30, 30],   ; Row 1, Column 1
	[-30, -30],
	[-30, 30],
	[-30, 0],
	[0, -30],
	[30, -30]
    ]
    for index, offset in gridOffsets {

        ; Adds the value that's stored in the array at the current index to either x or y's starting location
        gridX := startX + offset[2] ; Move horizontally by 'step' from the initial start location
        gridY := startY + offset[1] ; Move vertically by 'step' from the initial start location
		
        ; Handle card picker and related logic during grid placement
		if (ok := FindText(&cardX, &cardY, 196, 204, 568, 278, 0, 0, pick_card)) {
			cardSelector()
		}
        BetterClick(284, 400) ; next
        BetterClick(60, 450) ; move mouse
        if ShouldStopUpgrading(1) {
            AddToLog("Stopping due to finding lobby condition.")
            return LobbyLoop()
        }
        Reconnect()

        if PlaceUnit(gridX, gridY, slotNum) {
            placementCount++ ; Increment the placement count
            successfulCoordinates.Push({ x: gridX, y: gridY, slot: "slot_" slotNum }) ; Track the placement
            AddToLog("Placed unit at (" gridX ", " gridY ") in 3x3 grid.")

            ; Update or initialize saved placements for the current slot
            try {
                if savedPlacements.Get("slot_" slotNum) {
                    savedPlacements.Set("slot_" slotNum, savedPlacements.Get("slot_" slotNum) + 1)
                }
            } catch {
                savedPlacements.Set("slot_" slotNum, 1)
            }



            ; Check if placement limit is reached
            if placementCount >= placements {
                break
            }

        }

    } ; End for

}

IsMaxed(coord) {
    global maxedCoordinates
    for _, maxedCoord in maxedCoordinates {
        if (maxedCoord.x = coord.x && maxedCoord.y = coord.y) {
            return true
        }
    }
    return false
}

UpgradeUnits() {
    if UUPCheckbox.Value = 1 {
        global successfulCoordinates, maxedCoordinates, unitUpgradePrioritydropDowns
        AddToLog("Beginning prioritized unit upgrades.")

        priorityMapping := []
        for index, dropDown in unitUpgradePrioritydropDowns {
            priorityText := dropDown.Text
            if priorityText && priorityText != "" {
                priorityMapping.Push(priorityText)
            }
        }

        SortByPriority(&successfulCoordinates, priorityMapping)

        for coord in successfulCoordinates {
            if IsMaxed(coord) {
                AddToLog("Unit already maxed at: X" coord.x " Y" coord.y ". Skipping upgrade.")
                continue
            }
            while !IsMaxUpgrade() {
                UpgradeUnit(coord.x, coord.y)
                if (IsMaxUpgrade()) {
                    break
                }
                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    sentTab := false
                    return LobbyLoop()
                }

                Sleep(200)

                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) {
                    BetterClick(373, 237)
                }

                if (winterEventEnabled = 1 && (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, pick_card))) {
                    cardSelector()
                }

                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                Reconnect()
            }

            if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
            {
                BetterClick(373, 237)
            }

            BetterClick(565, 563) ; move mouse
            AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y ". Moving onto next unit")
            maxedCoordinates.Push(coord)
        }

        AddToLog("All units upgraded or maxed.")
        while !ShouldStopUpgrading() {
            BetterClick(348, 391) ; next
            Sleep(200)
        }

        return LobbyLoop()
    }
    else
    {
        global successfulCoordinates
        global maxedCoordinates

        AddToLog("Beginning unit upgrades.")

        while true { ; Infinite loop to ensure continuous checking
            for index, coord in successfulCoordinates {

                UpgradeUnit(coord.x, coord.y)

                if ShouldStopUpgrading() {
                    AddToLog("Found return to lobby, going back.")
                    successfulCoordinates := []
                    maxedCoordinates := []
                    return LobbyLoop()
                }

                if IsMaxUpgrade() {
                    AddToLog("Max upgrade reached for: X" coord.x " Y" coord.y)
                    maxedCoordinates.Push(successfulCoordinates.Get(index))
                    successfulCoordinates.RemoveAt(index) ; Remove the coordinate
                    continue ; Skip to the next coordinate
                }

                Sleep(200)
                if (ok := FindText(&X, &Y, 334, 182, 450, 445, 0, 0, AutoAbility)) ; USE ABILITY IF OFF
                {
                    BetterClick(373, 237)
                }

                if (winterEventEnabled = 1 && (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, pick_card))) {
                    cardSelector()
                }
                BetterClick(348, 391) ; next
                BetterClick(565, 563) ; move mouse
                Reconnect()
            }

            ; If all units are maxed, still check for stopping condition
            if successfulCoordinates.Length = 0 and maxedCoordinates.Length > 0 {
                Reconnect()
                BetterClick(348, 391) ; next
                if ShouldStopUpgrading() {
                    AddToLog("Stopping due to finding return to lobby button.")
                    return LobbyLoop()
                }
                Sleep(2000) ; Prevent excessive looping

            }

            Reconnect()
        }
    }
}

SortByPriority(&array, priorityMapping) {
    AddToLog("Starting unit sorting by priority mapping")
    sortedArray := []

    for index, slot in priorityMapping {
        foundSlot := false

        for i, item in array {
            if (item.slot = slot) {
                sortedArray.Push(item)
                foundSlot := true
            }
        }

        if !foundSlot {
            AddToLog("No units found for: " slot ". Moving onto next slot")
        }
    }

    array := sortedArray
    AddToLog("Finished sorting units, starting upgrading")
}


UpgradeUnit(x, y) {
    BetterClick(x, y - 3)
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
    BetterClick(264, 363) ; upgrade
}

IsMaxUpgrade() {
    Sleep 500
    if (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade2)) or (ok := FindText(&X, &Y, 142, 346, 406, 472, 0, 0, MaxUpgrade3)))
    {
        return true
    }
}

ShouldStopUpgrading(sleepamount := 300) {
    global loss
    global wins
    Sleep sleepamount
    if CheckForLobbyButton() {
        if (WebhookCheckbox.Value = 1) {
            if Checkforloss() {
                loss++
                SendInput ("{Tab}")
                Sleep 100
                LossWebhook()
            } else if !Checkforloss() {
                wins++
                SendInput ("{Tab}")
                Sleep 100
                sendWebhook()
            }
        }
        BetterClick(376, 117)
        return true
    }
}

Checkforloss() {
    if (ok:=FindText(&X, &Y, 368, 90, 497, 130, 0, 0, DeathText))
    {
        return true
    }
    return false
}

FindAndClickColor(targetColor := (winterEventEnabled = 1 ? 0x006783 : 0xFAFF4D), searchArea := [0, 0, A_ScreenWidth, A_ScreenHeight]) { ;targetColor := Winter Event Color : 0x006783 / Contracts Color : 0xFAFF4D
    ; Extract the search area boundaries
    x1 := searchArea[1], y1 := searchArea[2], x2 := searchArea[3], y2 := searchArea[4]

    ; Perform the pixel search
    if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, targetColor, 0)) {
        ; Color found, click on the detected coordinates
        BetterClick(foundX, foundY, "Right")
        AddToLog("Color found and clicked at: X" foundX " Y" foundY)
        return true

    } else {
        if (winterEventEnabled = 1) {
            AddToLog("Color not found, trying green")
            if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, 0x94FF45, 0)) { ;Green Path
                ; Color found, click on the detected coordinates
                BetterClick(foundX, foundY, "Right")
                AddToLog("Color found and clicked at: X" foundX " Y" foundY)
                return true
        
            } else {
                AddToLog("Color not found, trying pink")
                if (PixelSearch(&foundX, &foundY, x1, y1, x2, y2, 0xFF00FF, 0)) { ;Pink Path
                    ; Color found, click on the detected coordinates
                    BetterClick(foundX, foundY, "Right")
                    AddToLog("Color found and clicked at: X" foundX " Y" foundY)
                    return true
            
                }
            }
        }
    }
}


OnSpawn() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    OnSpawnSetup()
}

LookDown() {
    MouseMove(400, 300)
    loop 20 {
        SendInput("{WheelUp}")
        Sleep 50
    }
    Sleep 200
    MouseGetPos(&x, &y)
    MouseMove(400, 300)
    SendInput(Format("{Click {} {} Left}", x, y + 150))

    loop 20 { ; loop 20
        SendInput("{WheelDown}")
        Sleep 50
    }
}

LoadedLoop() {
    global hasReconnect
    AddToLog("Waiting to load in")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            global StageStartTime := A_TickCount
            AddToLog("Loaded in")
            if (hasReconnect == 1 && DisconnectCheckbox.Value == 1) {
                sendRCWebhook()
                hasReconnect := 0
            }
            break
        }
        else if (ok := FindText(&X, &Y, 606, 47, 648, 85, 0, 0, P)) {
            Sleep 10000
            if (ok := FindText(&X, &Y, 606, 47, 648, 85, 0, 0, P) and !(ok :=
                FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))) {
                global StageStartTime := A_TickCount
                AddToLog("Loaded in late")
                if (hasReconnect == 1 && DisconnectCheckbox.Value == 1) {
                    sendRCWebhook()
                    hasReconnect := 0
                }
                break
            }
        }

        Reconnect()
    }
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        AddToLog("Sending chat")
        SendChat()
    }
}

StartedLoop() {
    AddToLog("Spawn setup starting")
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
            Sleep 1000
			OnSpawnSetup()
            break
        }
        break
    }
    AddToLog("Spawn setup done, waiting for vote start")
    	BetterClick(350, 103) ; click yes
        BetterClick(350, 100) ; click yes
        BetterClick(350, 97) ; click yes
	Sleep 100
	loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart))
        {
            continue
        }
        break
    }
    AddToLog("Game started, waiting 6s for income")
	Sleep(6000)
}

LobbyLoop() {
    loop {
        Sleep 1000
        if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText))
        {
            break
        }
        Reconnect()
    }
    AddToLog("Returned to lobby, going back to raids")
    return GoToRaids()
}

CheckForLobbyButton() {
    if (ok := FindText(&X, &Y, 273, 103, 482, 214, 0, 0, LobbyText))
    {
        return true
    }
}

SendChat() {
    SendInput("/")
    Sleep 250
    chat := ChatToSend.Value
    if (ChatStatusBox.Value = 1 && StrLen(chat) > 0) {
        for char in StrSplit(chat) {
            Send(char)
            Sleep(Random(100, 200))  ; Optional delay between each keypress
        }
    }
    Sleep 1200
    SendInput("{Enter}")
    Sleep 250
    BetterClick(130, 43)
}

TPtoSpawn() {
    BetterClick(27, 574) ; settings
    Sleep 1000
    BetterClick(400, 287)
    Sleep 600
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ; scroll
    }
    Sleep 600
    BetterClick(525, 360) ; tp to spawn with updated coords
    Sleep 600
    BetterClick(582, 150) ; exit settings

}

TPtoSpawnTest() {
    BetterClick(26, 570) ;click settings
    Sleep 300
    BetterClick(400, 215)
    Sleep 300
    loop 4 {
        Sleep 150
        SendInput("{WheelDown 1}") ;scroll
    }
    Sleep 300
    if (ok := FindText(&X, &Y, 215, 160, 596, 480, 0, 0, Spawn)) {
        AddToLog("Found Teleport to Spawn button")
        BetterClick(X + 50, Y - 30)
    } else {
        AddToLog("Could not find Teleport button")
    }
    Sleep 300
    BetterClick(583, 147)
    Sleep 300
}

DebugOCR() {
    if ControlGetVisible(keybindsGui) {
        return
    }
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
        ;for char in StrSplit(captcha) {
        ;    Send(char)
        ;    Sleep(Random(25, 75))  ; Optional delay between each keypress
        ;}
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
}

AntiCaptcha() {

    ; Perform OCR on the defined region directly
    ocrResult := OCR.FromRect(266, 309, 603 - 266, 352 - 309, , 2)

    ; Display OCR results
    Reconnect()
    if ocrResult {
        BetterClick(414, 342)
        AddToLog("Captcha Detected: " ocrResult.Text)

        ; Clean up the captcha string
        captcha := StrReplace(ocrResult.Text, " ")  ; Remove spaces
        if (StrLen(captcha) <= 1 || RegExMatch(captcha, "[A-Za-z]")) {
            AddToLog("invalid captcha retrying")
            BetterClick(584, 192) ; close captcha
            return
        }

        ; Remove special characters like /, -, and .
        captcha := RegExReplace(captcha, "[/.\-_,]")

        ; Send each character
        Send(captcha)
    } else {
        AddToLog("NO CAPTCHA FOUND.")
    }
    BetterClick(309, 386) ; confirm matchmaking
    Sleep 1500
    BetterClick(383, 221)
    Sleep 500
    AddToLog("Waiting to be teleported for matchmaking")
    CaptchaSleep() ; Custom sleep for people with slower internet or if roblox is having issues
    if (ok := FindText(&X, &Y, 10, 70, 350, 205, 0, 0, LoadingScreen)) {
        return
    }
    if (ok := FindText(&X, &Y, 326, 60, 547, 173, 0, 0, VoteStart)) {
        return
    }
    Sleep 1500
    if (ok := FindText(&X, &Y, 221, 206, 403, 355, 0, 0, MatchmakeUI))
    {
        AddToLog("Waiting for captcha cooldown then retrying")
        Sleep 6000
    }
    Reconnect()
    return
}

CaptchaSleep() {
    if (CaptchaDropdown.Value = 1) {
        Sleep 2000
        AddToLog("Sleeping for 2 seconds")
    }
    if (CaptchaDropdown.Value = 2) {
        Sleep 4000
        AddToLog("Sleeping for 4 seconds")
    }
    if (CaptchaDropdown.Value = 3) {
        Sleep 6000
        AddToLog("Sleeping for 6 seconds")
    }
    if (CaptchaDropdown.Value = 4) {
        Sleep 8000
        AddToLog("Sleeping for 8 seconds")
    }
    if (CaptchaDropdown.Value = 5) {
        AddToLog("Sleeping for 10 seconds")
        Sleep 10000
    }
}

PlacementTimerSleep() { ; Added for custom dropdown support
    if (PlacementTimerDropdown.Value = 1) {
        Sleep 1500
    }
    if (PlacementTimerDropdown.Value = 2) {
        Sleep 2000
    }
    if (PlacementTimerDropdown.Value = 3) {
        Sleep 2500
    }
    if (PlacementTimerDropdown.Value = 4) {
        Sleep 3000
    }
    if (PlacementTimerDropdown.Value = 5) {
        Sleep 3500
    }
}

TapToMove(toggle) {

    SendInput("{Esc}")
    Sleep 1000
    BetterClick(246, 91)
    Sleep 500
    SendInput("{Down}")
    Sleep 100
    SendInput("{Down}")
    Sleep 500
    if (toggle) {
        SendInput("{Right}")
        Sleep 400
        SendInput("{Right}")
    }
    else {
        SendInput("{Left}")
        Sleep 400
        SendInput("{Left}")
    }
    Sleep 500
    SendInput("{Esc}")
    Sleep 1000
}

OnSpawnSetup() {
    SendInput ("{Tab}")
    LookDown()
    Sleep 200
    if (winterEventEnabled) {
        TPtoSpawnTest()
    }
    Sleep 200
    ;TapToMove(true)
    Sleep 200
    BetterClick(590, 15) ; click on paths
    Sleep 200
    AddToLog("Attempting to move to spot")
    loop 80 {
        Sleep 100

        if FindAndClickColor() {
            break
        }
    }
    Sleep 4000
    BetterClick(590, 15) ; click on paths
    Sleep 1000
    ;TapToMove(false)

}

Reconnect() {
    ; Check for Disconnected Screen
    color := PixelGetColor(519, 329) ; Get color at (519, 329)
    global hasReconnect
    if (color = 0x393B3D) {
        AddToLog("Disconnected! Attempting to reconnect...")
        if (DisconnectCheckbox.Value = 1) {
            sendDCWebhook()
        }

        ; Use Roblox deep linking to reconnect
        Run("roblox://placeID=" 8304191830)
        Sleep 2000
        if WinExist(RobloxWindow) {
            WinMove(27, 15, 800, 600, RobloxWindow)
            WinActivate(RobloxWindow)
            Sleep 1000
        }
        loop {
            AddToLog("Reconnecting to Roblox...")
            Sleep 15000
            if (ok := FindText(&X, &Y, 746, 476, 862, 569, 0, 0, AreasText)) {
                AddToLog("Reconnected Succesfully!")
                hasReconnect := 1
                return GoToRaids() ; Check for challenges in the lobby
            }
            else {
                Reconnect()
            }
        }
    }
}

cardSelector() {
    AddToLog("Picking card in priority order")
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        BetterClick(329, 184) ; close upg menu
        sleep 100
    }

    BetterClick(59, 572) ; Untarget Mouse
    sleep 500

    for index, priority in priorityOrder {
        if (!textCards.Has(priority)) {
            continue
        }
        if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, textCards.Get(priority))) {
            FindText().Click(cardX, cardY, 0)
            MouseMove 0, 10, 2, "R"
            Click 2
            sleep 1000
            MouseMove 0, 120, 2, "R"
            Click 2
            AddToLog(Format("Picked card: {}", priority))
            sleep 5000
            return
        }
    }
    AddToLog("Failed to pick a card")
}

;Added by @raynnpjl
cardSelectorBackup() {
    AddToLog("Picking card")
    if (ok := FindText(&X, &Y, 78, 182, 400, 451, 0, 0, UnitExistence)) {
        BetterClick(329, 184) ; close upg menu
        sleep 100
    }
    Click "256 334 0" ; Card Select 1
    sleep 100
    Click "403 334 0" ; Card Select 2
    sleep 100
    Click "547 334 0" ; Card Select 3
    sleep 100
    BetterClick(59, 572) ; Untarget Mouse
    sleep 500
    if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, new_path)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked new_path")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, shield)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy shield")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, health)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy health")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, regen)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy regen")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, explosive_death)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked explosive_death")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, speed)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked enemy speed")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, range)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked range buff")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, attack)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked attack buff")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, cooldown)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked cooldown")
        sleep 5000
    }
    else if (ok := FindText(&cardX, &cardY, 209, 203, 652, 404, 0, 0, yen)) {
        FindText().Click(cardX, cardY, 0)
        MouseMove 0, 10, 2, "R"
        Click 2
        sleep 1000
        MouseMove 0, 120, 2, "R"
        Click 2
        AddToLog("Picked yen buff")
        sleep 5000
    }
    else {
        AddToLog("Failed to pick a card")
    }
}