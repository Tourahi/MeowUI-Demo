m = require "moon"
export dump = m.p
assert require "MeowUI"
Graphics = love.graphics


-- Examples
Frame = assert require MeowUI.c_cwd .. "Frame"
Label = assert require MeowUI.c_cwd .. "Label"
Content = assert require MeowUI.c_cwd .. "Content"
Button = assert require MeowUI.c_cwd .. "Button"
CheckBox = assert require MeowUI.c_cwd .. "CheckBox"
TextInput = assert require MeowUI.c_cwd .. "TextInput"

manager = MeowUI.manager
root = manager\getRoot!

-- These will show in the panel as btns.
G_controls = {
  "Frame",
  "Button",
  "checkBox",
  "Label",
  "TextInput",
}

initFrameEx = ->
  G_controls[1][2]\onClick ->
    frame = with Frame "Frame", false, false
      \setSize 200, 100
      \setPosition 200, 200
    root\addChild frame

initBtnEx = ->
  G_controls[2][2]\onClick ->
    bPoly = with Button "Polygon"
      \setPosition 150, 65
      \setRadius 25
      \setSides 6

    bCircle = with Button "Circle"
      \setPosition 190, 90
      \setRadius 4.5
      \onClick ->
        bPoly\setSides bPoly\getSides! + 1

    bLogo = with Button "Circle"
      \setPosition 40, 65
      \setImage MeowUI.assets .. "Logo.png", true
      \setStroke 1

    bRec = with Button "Box"
      \setPosition 75, 40
      \setSize 45, 45

    frame = with Frame "Buttons", false, false
      \setSize 200, 100
      \setPosition 200, 200
      \addChild bCircle
      \addChild bLogo
      \addChild bRec
      \addChild bPoly

    root\addChild frame

initCheckboxEx = ->
  G_controls[3][2]\onClick ->
    cbRec = with CheckBox "Box"
      \setPosition 45, 50
      \setSize 30, 30

    cbCircle = with CheckBox "Circle"
      \setPosition 95, 64
      \setRadius 15
      \linkTo cbRec

    cbPoly = with CheckBox "Polygon"
      \setPosition 130, 64
      \setRadius 15
      \setSides 6
      \linkTo cbRec

    frame = with Frame "Checkbox", false, false
      \setSize 200, 100
      \setPosition 200, 200
      \addChild cbRec
      \addChild cbCircle
      \addChild cbPoly

    root\addChild frame

initLabelEx = ->
  G_controls[4][2]\onClick ->
    label = with Label 15, "This is a label!!", {0.765, 0.549, 0.929}
      \setPosition 45, 50

    frame = with Frame "Label", false, false
      \setSize 200, 100
      \setPosition 200, 200
      \addChild label

    root\addChild frame

initTxtInputEx = ->
  G_controls[5][2]\onClick ->
    textInpt = with TextInput "Is this working ?"
      \setPosition 25, 50

    frame = with Frame "TextInput", false, false
      \setSize 200, 100
      \setPosition 200, 200
      \addChild textInpt

    root\addChild frame
initExamplesList = ->
  content = with Content "Examples"
    \setPosition Graphics.getWidth! - 200, 0
    \setEnabled true
    \setSize 200, Graphics.getHeight!

  title = with Label MeowUI.assets .. "Iosevka-Bold.ttc", "Examples", nil, 25
    \setPosition 52, 5
    \setColor {0, 0.8, 1, 1}

  offset = 45
  for k, v in ipairs G_controls
    btn = with Button "Box"
      \setPosition 10, offset
      \setSize 180, 35
      \setText v
      \setFocusEnabled false
    
    offset += 45
    G_controls[k] = {v, btn}
    content\addChild btn
  
  initFrameEx!
  initBtnEx!
  initCheckboxEx!
  initLabelEx!
  initTxtInputEx!

  content\addChild title
  root\addChild content


with love
  .load = ->
    initExamplesList!
    Graphics.setBackgroundColor 0.2, 0.2, 0.2

  .update = (dt) ->
    manager\update dt

  .draw = ->
    manager\draw!

  .mousepressed = (x, y, button) ->
    manager\mousepressed x, y, button

  .keypressed = (key, is_r) ->
    manager\keypressed key, is_r

  .mousemoved = (x, y, dx, dy, istouch ) ->
    manager\mousemoved x, y, dx, dy, istouch

  .mousereleased = (x, y, dx, dy, istouch ) ->
    manager\mousereleased x, y, dx, dy, istouch

  .wheelmoved = (x, y) ->
    manager\wheelmoved x, y

  .keyreleased = (key) ->
    manager\keyreleased key

  .textinput = (text) ->
    manager\textinput text
