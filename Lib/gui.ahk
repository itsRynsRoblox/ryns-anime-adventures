#Requires AutoHotkey v2
#Include %A_ScriptDir%\Lib\guidegui.ahk
#Include %A_ScriptDir%\Lib\webhooksgui.ahk
#Include %A_ScriptDir%\Lib\config.ahk
#Include %A_ScriptDir%\Lib\mainsettingsui.ahk
#Include %A_ScriptDir%\Lib\keybinds.ahk
#Include %A_ScriptDir%\Lib\PriorityPicker.ahk
#Include %A_ScriptDir%\Lib\UnitUpgradePriority.ahk

GemsEarned := 0
ShibuyaFood := 0
TraitRerolls := 0
StatChips := 0
SuperStatChips := 0
GreenEssence := 0
ColoredEssence := 0
CurrentChallenge := "None"
MinimizeImage := "Lib\Images\minimize.png"
CloseImage := "Lib/Images/close.png"
TaxiImage := "Lib\Images\faxi pfp.png"
GithubImage := "Lib\Images\github-logo.png"
DiscordImage := "Lib\Images\Discord-Logo.png"
lastlog := ""
MainGUI := Gui("-Caption +Border +AlwaysOnTop", "Ryns Hub Macro")

MainGUI.BackColor := "0c000a"
MainGUI.SetFont("s9 bold", "Segoe UI")

;CloseAppButton := MainGUI.Add("Picture", "x910 y8 w60 h34 +BackgroundTrans cffffff", DiscordImage)
CloseAppButton := MainGUI.Add("Picture", "x112 y645 w60 h34 +BackgroundTrans cffffff", DiscordImage)
CloseAppButton.OnEvent("Click", (*) => OpenDiscord())

;CloseAppButton := MainGUI.Add("Picture", "x890 y-10 w90 h90 +BackgroundTrans cffffff", TaxiImage)
;CloseAppButton.OnEvent("Click", (*) => OpenFaxiDiscord())

CloseAppButton := MainGUI.Add("Picture", "x30 y640 w40 h40 +BackgroundTrans cffffff", GithubImage)
CloseAppButton.OnEvent("Click", (*) => OpenGithub())

MinimizeButton := MainGUI.Add("Picture", "x1000 y22 w37 h9 +BackgroundTrans cffffff", MinimizeImage)
MinimizeButton.OnEvent("Click", (*) => MinimizeGUI())

CloseAppButton := MainGUI.Add("Picture", "x1052 y10 w30 h32 +BackgroundTrans cffffff", CloseImage)
CloseAppButton.OnEvent("Click", (*) => ExitApp())

GuideBttn := MainGui.Add("Button", "x830 y43 w238 cffffff +BackgroundTrans +Center", "How to use?")
GuideBttn.OnEvent("Click", (*) => OpenGuide())

ConnectPSBttn := MainGui.Add("Button", "x830 y632 w98 cffffff +BackgroundTrans +Center", "Connect to PS")
ConnectPSBttn.OnEvent("Click", (*) => ConnectPS())

UnitTimer := MainGui.Add("DropDownList", "x703 y667 w90 Choose2", ["1.5s", "2s (Default)", "2.5s", "3s"])
MainGUI.Add("Text", "x600 y670 h60 c2bff00 +BackgroundTrans", "Placement Speed")

CaptchaTimer := MainGui.Add("DropDownList", "x495 y667 w90 Choose2", ["2s", "5s (Default)", "7s", "10s"])
MainGUI.Add("Text", "x410 y670 h60 c2bff00 +BackgroundTrans", "Captcha Retry")

GamemodeDropDown := MainGui.Add("DropDownList", "x295 y667 w105 Choose2", ["Academy Infinite", "Contracts", "Cursed Womb", "Winter Event"])
MainGUI.Add("Text", "x210 y670 h60 c2bff00 +BackgroundTrans", "Mode Select")

GamemodeDropDown.OnEvent("Change", OnModeChange)

OnModeChange(*) {
    global mode
    selected := GamemodeDropDown.Text
    
    if (selected = "Academy Infinite") {
        mode := "Academy Infinite"
    } else if (selected = "Cursed Womb") {
        mode := "Cursed Womb"
        MsgBox("This macro works fine most of the time, but currently the macro is NOT setup to detect if you are over your cursed token limits.", "Use Cursed Womb At Your Own Risk!", "+0x1000",)
    } else if (selected = "Winter Event") {
        mode := "Winter Event"
    } else if (selected = "Contracts") {
        mode := "Contracts"
    }
}

#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

; Create the initial GUI
MainSettings := Gui("+AlwaysOnTop")
MainSettings.SetFont("s8 bold", "Segoe UI")

; Set GUI properties
MainSettings.BackColor := "0c000a"
MainSettings.MarginX := 20
MainSettings.MarginY := 20
MainSettings.OnEvent("Close", (*) => MainSettings.Hide())
MainSettings.Title := "Main Settings UI"

MainSettings.Add("Text", "x30 y20 w340 h190 +Center cffffff", "Settings")

; Add Launch Button
Webhookbttn := MainSettings.Add("Button", "x30 y45 w150", "Webhook Settings")
Webhookbttn.OnEvent("Click", (*) => OpenWebhooks())

PSbttn := MainSettings.Add("Button", "x220 y45 w150", "Auto Reconnect Settings")
PSbttn.OnEvent("Click", (*) => PSLinkSettingsUI())

;SendChatBttn := MainSettings.Add("Button", "x220 y45 w150", "Timer Settings")

SendChatBttn := MainSettings.Add("Button", "x30 y110 w150", "Keybinds")
SendChatBttn.OnEvent("Click", (*) => OpenKeybinds())

SendChatBttn := MainSettings.Add("Button", "x30 y170 w150", "Upgrade Priority")
SendChatBttn.OnEvent("Click", (*) => OpenUnitUpgrade())

SendChatBttn := MainSettings.Add("Button", "x220 y110 w150", "Card Priority")
SendChatBttn.OnEvent("Click", (*) => OpenPriorityPicker())

SendChatBttn := MainSettings.Add("Button", "x220 y170 w150", "Placement Logic")
SendChatBttn.OnEvent("Click", (*) => OpenPlacementLogic())

global PlacementLogicUI := Gui("+AlwaysOnTop")
PlacementLogicUI.SetFont("s10 bold", "Segoe UI")
PlacementLogicUI.BackColor := "0c000a"
PlacementLogicUI.MarginX := 20
PlacementLogicUI.MarginY := 20

PlacementLogicUI.Add("Text", "x10 y8 w250 cWhite", "If you feel like the placement is not working as intended, change this option")

PlacementLogicUI.SetFont("s8", "Segoe UI")
global PlacementDropdown := PlacementLogicUI.Add("DropDownList", "x10 y60  w250 cffffff", ["Spiral", "Lines","Lines + 3x3 Grid Finder", "Zig Zag", "Zig Zag + 3x3 Grid Finder", "Spiral + 3x3 Grid Finder"])

OpenPlacementLogic() {
    PlacementLogicUI.Show()
}

; Show the main settings GUI
; Show the initial GUI
OpenSettings() {
    MainSettings.Show("AutoSize Center")
}

Ability := MainGUI.Add("Checkbox", "x210 y648 w105 c2bff00 Checked", "Auto Ability")
Ability.OnEvent('Click', (*) => changeAutoAbility())

changeAutoAbility() {
    global autoAbilityEnabled := Ability.Value
}

ReturnToLobby := MainGUI.Add("Checkbox", "x650 y648 w115 c2bff00 ", "Return to Lobby")
ReturnToLobby.OnEvent('Click', (*) => changeReturnToLobby())

changeReturnToLobby() {
    global returnToLobbyEnabled := ReturnToLobby.Value
}

;WinterEvent := MainGUI.Add("Checkbox", "x320 y648 w105 c2bff00", "Winter Event")
;WinterEvent.OnEvent('Click', (*) => changeWinterEvent())

;CursedWomb := MainGUI.Add("Checkbox", "x540 y648 w105 c2bff00 ", "Cursed Womb")
;CursedWomb.OnEvent('Click', (*) => changeCursedWomb())

MatchmakingOrSolo := MainGUI.Add("Checkbox", "x430 y648 w105 c2bff00 Checked", "Matchmaking")
MatchmakingOrSolo.OnEvent('Click', (*) => changeMatchmaking())

changeMatchmaking() {
    global matchmakingEnabled := MatchmakingOrSolo.Value
}

MainGUI.Add("Text", "x10 y5 h60 c2bff00 +BackgroundTrans", "Ryn's Anime Adventures Macro")

WebhookBtn := MainGui.Add("Button", "x965 y632 w105 cffffff +BackgroundTrans +Center", "Settings")
WebhookBtn.OnEvent('Click', (*) => OpenSettings())

MainGUI.AddProgress("c0x7e4141 x8 y27 h602 w800", 100) ; box behind roblox, credits to yuh for this idea
WinSetTransColor("0x7e4141 255", MainGUI)

MainGUI.Add("GroupBox", "x190 y630 w615 h65 cd9ff00 ", "Macro Settings")

MainGUI.Add("GroupBox", "x830 y70 w238 h250 c2bff00 ", "Unit Setup")
enabled1 := MainGUI.Add("Checkbox", "x840 y90 cffffff", "Slot 1")
enabled2 := MainGUI.Add("Checkbox", "x840 y120 cffffff", "Slot 2")
enabled3 := MainGUI.Add("Checkbox", "x840 y150 cffffff", "Slot 3")
enabled4 := MainGUI.Add("Checkbox", "x840 y180 cffffff", "Slot 4")
enabled5 := MainGUI.Add("Checkbox", "x840 y210 cffffff", "Slot 5")
enabled6 := MainGUI.Add("Checkbox", "x840 y240 cffffff", "Slot 6")

placement1 := MainGUI.Add("DropDownList", "x1020 y90  w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement2 := MainGUI.Add("DropDownList", "x1020 y120 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement3 := MainGUI.Add("DropDownList", "x1020 y150 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement4 := MainGUI.Add("DropDownList", "x1020 y180 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement5 := MainGUI.Add("DropDownList", "x1020 y210 w40 cffffff Choose3", [1, 2, 3, 4, 5])
placement6 := MainGUI.Add("DropDownList", "x1020 y240 w40 cffffff Choose3", [1, 2, 3, 4, 5])

MainGUI.Add("Text", "x940 y90 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x940 y120 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x940 y150 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x940 y180 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x940 y210 h60 cffffff +BackgroundTrans", "Placements: ")
MainGUI.Add("Text", "x940 y240 h60 cffffff +BackgroundTrans", "Placements: ")

SaveConfigBttn := MainGUI.Add("Button", "x840 y280 w95 h30 cffffff +Center", "Load config")
SaveConfigBttn.OnEvent("Click", (*) => LoadConfig())

SaveConfigBttn := MainGUI.Add("Button", "x960 y280 w95 h30 cffffff +Center", "Save config")
SaveConfigBttn.OnEvent("Click", (*) => SaveConfig())


MainGUI.Add("GroupBox", "x830 y320 w238 h210 c2bff00 ", "Activity Log ")
ActivityLog := MainGUI.Add("Text", "x830 y340 w238 h300 r11 cffffff +BackgroundTrans +Center", "Be sure to enable click to move.")

MainGUI.Add("GroupBox", "x830 y540 w238 h80 c2bff00 ", "Keybinds")
KeyBinds := MainGUI.Add("Text", "x830 y560 w238 h300 r7 cffffff +BackgroundTrans +Center", "F1 - Fix Roblox Position `n F2 - Start Macro `n F3 - Stop Macro")

MainGUI.SetFont("s16 bold", "Segoe UI")

;MainGUI.Add("Text", "x12 y650 w800 c2bff00 +BackgroundTrans", "Ryn's Hub Macro")

MainGUI.Show("x27 y15 w1100 h700")

AddToLog(text) {
    global lastlog
    ActivityLog.Value := text "`n" ActivityLog.Value
}

MinimizeGUI() {
    WinMinimize("Ryns Hub Macro")
}

OpenFaxiDiscord() {
    Run("https://discord.gg/UB9AaPzqdq")
}

OpenGithub() {
    Run("https://github.com/itsRynsRoblox?tab=repositories")
}

OpenDiscord() {
    Run("https://discord.gg/6DWgB9XMTV")
}


SendChatGUI := Gui("+AlwaysOnTop")

SendChatGUI.SetFont("s8 bold", "Segoe UI")
SendChatGUI.Add("Text", "x10 y8 w280 cWhite", "Would you like the macro to send a message once it loads in a game? (it only sends it once per game and this is optional)")

SendChatGUI.Add("Text", "x10 y56 cWhite", "Message to send")
ChatToSend := SendChatGUI.Add("Edit", "x10 y70 w280", "")

ChatStatusBox := SendChatGUI.Add("Checkbox", "x10 y109 cWhite", "Enabled")

SendChatGUI.BackColor := "0c000a"
SendChatGUI.MarginX := 20
SendChatGUI.MarginY := 20

SendChatGUI.OnEvent("Close", (*) => SendChatGUI.Hide())
SendChatGUI.Title := "Send Chat"


OpenSendChat() {
    SendChatGUI.Show("w300 h150")
}

if FileExist("C:\config.txt") {
    LoadGlobal()
} else {
    LoadLocal()
}