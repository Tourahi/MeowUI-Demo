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

initExamplesList = ->
  content = Content "Examples"
  title = Label MeowUI.assets .. "SAIBA-45-Outline.ttf", "Examples", nil, 25
  controls = {
    "Frame"
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

    controls[1][2]\onClick ->
      p = Frame "frame", false, false
      with p
        \setSize 200, 100
        \setPosition 200, 200
      root\addChild p

    content\addChild btn

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
