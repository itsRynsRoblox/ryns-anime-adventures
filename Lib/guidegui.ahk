#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2

; Function to open the guide
OpenGuide() {
    GuideGUI.Show("w800")
}

; Function to load built-in macros

GuideGUI := Gui("+AlwaysOnTop")
GuideGUI.SetFont("s10 bold", "Segoe UI")
GuideGUI.Title := "Contract Guide"

GuideGUI.BackColor := "0c000a"
GuideGUI.MarginX := 20
GuideGUI.MarginY := 20
GuideGUI.OnEvent("Close", (*) => GuideGUI.Hide())

; Add an image\

GuideGUI.SetFont("s16 bold", "Segoe UI")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "1 - In your AA settings make sure you have these 2 settings set to this")
GuideGUI.Add("Picture", "x100 w600 h160 cWhite +Center", "Lib\Images\aasettings.png")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "2 - In your ROBLOX settings, make sure your keyboard is set to Click to move and your graphics are set to 1")
GuideGUI.Add("Picture", "x50 w700   cWhite +Center", "Lib\Images\clicktomove.png")
GuideGUI.Add("Picture", "x50 w700   cWhite +Center", "Lib\Images\graphics1.png")
GuideGUI.Add("Text", "x0 w800 cWhite +Center", "3 - Set up the unit setup however you want, however I'd avoid hill only units if you can since it might break")

GuideGUI.Add("Text", "x0 w800 cWhite +Center", "4 - Rejoin Anime Adventures, dont move your camera at all and press F2 to start the macro. Good luck!" )

; Function to open the guide
PSLinkGuide() {
    PSLinkGuideGUI.Show("w800")
}

; Function to load built-in macros

PSLinkGuideGUI := Gui("+AlwaysOnTop")
PSLinkGuideGUI.SetFont("s10 bold", "Segoe UI")
PSLinkGuideGUI.Title := "PS Link Guide"

PSLinkGuideGUI.BackColor := "0c000a"
PSLinkGuideGUI.MarginX := 20
PSLinkGuideGUI.MarginY := 20
PSLinkGuideGUI.OnEvent("Close", (*) => PSLinkGuideGUI.Hide())

; Add an image\

PSLinkGuideGUI.SetFont("s16 bold", "Segoe UI")

PSLinkGuideGUI.Add("Text", "x3 w800 cWhite +Center", "Copy your PS link from here")
PSLinkGuideGUI.Add("Picture", "x20 w760 h85 Center", "Lib\Images\pslink1.png") ; Update the path to your image

PSLinkGuideGUI.Add("Text", "x0 w800 cWhite +Center", "Paste the link into your browser")
PSLinkGuideGUI.Add("Picture", "x20 w760 Center", "Lib\Images\pslink2.png") ; Update the path to your image

PSLinkGuideGUI.Add("Text", "x0 w800 cWhite +Center", "A different link will now appear, copy it and paste it into the PS link box!")
PSLinkGuideGUI.Add("Picture", "x20 w760  Center", "Lib\Images\pslink3.png") ; Update the path to your image

#Requires AutoHotkey v2.0
#MaxThreadsPerHotkey 2


