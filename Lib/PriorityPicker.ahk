; updated card priority from @haie's event macro
global PriorityCardSelector := Gui("+AlwaysOnTop")
PriorityCardSelector.SetFont("s10 bold", "Segoe UI")
PriorityCardSelector.BackColor := "0c000a"
PriorityCardSelector.MarginX := 20
PriorityCardSelector.MarginY := 20

PriorityOrder := PriorityCardSelector.Add("GroupBox", "x30 y25 w180 h800 cWhite", "Modifier Priority Order")

options := ["new_path", "range3", "attack3", "cooldown3", "range2", "attack2", "cooldown2", "blessing2", "range1", "attack1", "cooldown1", "explosive_death12", "shield1", "speed1", "health1", "regen1", "shield2", "speed2", "health2", "explosive_death3", "shield3", "speed3", "health3",  "blessing1", "yen", "regen2", "regen3"]

numDropDowns := 27
yStart := 50
ySpacing := 28

global dropDowns := []

For index, card in options {
    if (index > numDropDowns)
        Break
    yPos := yStart + ((index - 1) * ySpacing)
    PriorityCardSelector.Add("Text", Format("x38 y{} w30 h17 +0x200 cWhite", yPos), index)
    dropDown := PriorityCardSelector.Add("DropDownList", Format("x60 y{} w135 Choose{}", yPos, index), options)
    dropDowns.Push(dropDown)

    AttachDropDownEvent(dropDown, index)
}

OpenPriorityPicker() {
    PriorityCardSelector.Show()
}

global priorityOrder := ["new_path", "range3", "attack3", "cooldown3", "range2", "attack2", "cooldown2", "blessing2", "range1", "attack1", "cooldown1", "explosive_death12", "shield1", "speed1", "health1", "regen1", "shield2", "speed2", "health2", "explosive_death3", "shield3", "speed3", "health3",  "blessing1", "yen", "regen2", "regen3"]

priority := []

AttachDropDownEvent(dropDown, index) {
    dropDown.OnEvent("Change", (*) => OnDropDownChange(dropDown, index))
}

RemoveEmptyStrings(array) {
    for index, value in array {
        if (value = "") {
            array.RemoveAt(index)
        }
    }
}

OnDropDownChange(ctrl, index) {
    if (index >= 0 and index <= 27) {
        priorityOrder[index] := ctrl.Text
        AddToLog(Format("Priority {} set to {}", index, ctrl.Text))
        RemoveEmptyStrings(priorityOrder)
    } else {
        AddToLog(Format("Invalid index {} for dropdown", index))
    }
}