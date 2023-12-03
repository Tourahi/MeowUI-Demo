m = require "moon"
export dump = m.p
assert require "MeowUI"
Graphics = love.graphics


-- Examples
Frame = assert require MeowUI.c_cwd .. "Frame"
Label = assert require MeowUI.c_cwd .. "Label"
Content = assert require MeowUI.c_cwd .. "Content"
Button = assert require MeowUI.c_cwd .. "Button"


manager = MeowUI.manager
root = manager\getRoot!


initFrameEx = (controls) ->
  controls[1][2]\onClick ->
    p = Frame "Frame", false, false
    with p
      \setSize 200, 100
      \setPosition 200, 200
    root\addChild p

initBtnEx = (controls) ->
  controls[2][2]\onClick ->
    p = Frame "Button", false, false
    b = Button "Circle"
    bLogo = Button "Circle"
    bRec = Button "Box"
    bPoly = Button "Polygon"

    with p
      \setSize 200, 100
      \setPosition 200, 200

    with b
      \setPosition 190, 90
      \setRadius 4.5
      \onClick ->
        bPoly\setSides bPoly\getSides! + 1

    with bLogo
      \setPosition 40, 65
      \setImage MeowUI.assets .. "Logo.png", true
      \setStroke 1

    with bRec
      \setPosition 80, 40
      \setSize 45, 45

    with bPoly
      \setPosition 155, 65
      \setRadius 25
      
    p\addChild b
    p\addChild bLogo
    p\addChild bRec
    p\addChild bPoly

    root\addChild p


initExamplesList = ->
  content = Content "Examples"
  title = Label MeowUI.assets .. "SAIBA-45-Outline.ttf", "Examples", nil, 25
  controls = {
    "Frame",
    "Button",
    "checkBox",
    "Label",
    "TextInput",
  }
  

  with content
    \setPosition Graphics.getWidth! - 200, 0
    \setEnabled true
    \setSize 200, Graphics.getHeight!

  with title
    \setPosition 30, 5
    \setColor {0, 0.8, 1, 1}

  offset = 0
  for k, v in ipairs controls
    btn = Button "Box"
    offset += 45
    with btn
      \setPosition 10, offset
      \setSize 180, 35
      \setText v
      \setFocusEnabled false
    controls[k] = {v, btn}
    content\addChild btn

  
  initFrameEx controls
  initBtnEx controls


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
