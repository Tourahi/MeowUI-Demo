m = require "moon"
export dump = m.p
assert require "MeowUI"


Button = assert require MeowUI.c_cwd .."Button"
Content = assert require "MeowUI.Controls.Content"
Graphics = love.graphics


-- Examples
panel = assert require "examples.small_panel"

with love
  .load = ->
    panel.new "", {290, 300}, {250, 125}
    Graphics.setBackgroundColor 0.2, 0.2, 0.2

    export manager = MeowUI.manager
    root = manager\getRoot!

    content = Content ""
    button_ex1_1 = Button "Box"
    button_ex1_2 = Button "Box"
    button_ex2_1 = Button "Circle"
    button_ex2_2 = Button "Circle"
    button_ex3_1 = Button "Polygon"
    button_ex3_2 = Button "Polygon"

    r_next = Button "Polygon"
    sides_inc = Button "Box"

    with r_next
      \setRadius 10
      \setAngle 0.5
      \setPosition 180, 130
      \onClick ->
        content\next!
        if content\getCurrentSlideIdx! == 2 then content\attachScrollBarV "Box"
        else content\detachScrollBarV!

    with sides_inc
      \setPosition 10, 10
      \setSize 10, 10
      \onClick ->
        button_ex3_1\setFontSize 10
        button_ex3_1\setSides button_ex3_1\getSides! + 1
        button_ex3_2\setSides button_ex3_2\getSides! + 1

    with content
      \setPosition 250, 50
      \setEnabled true
      \setSize 200, 150

    s1_idx = content\getCurrentSlideIdx!
    s2_idx = content\addSlide false, nil, 300
    s3_idx = content\addSlide false

    with button_ex1_1
      \setPosition 110, 40
      \setImage "assets/Logo.png", true
      \setStroke 2

    with button_ex1_2
      \setPosition 30, 40
      \setSize 60, 60
      \setText "×"

    with button_ex2_1
      \setPosition 70, 75
      \setRadius 30
      \setFontSize 11
      \setText "Button"

    with button_ex2_2
      \setPosition 140, 75
      \setImage "assets/Logo.png", true

    with button_ex3_1
      \setPosition 70, 75
      \setRadius 30
      \setFontSize 8
      \setText "Button"

    with button_ex3_2
      \setPosition 140, 75
      \setImage "assets/Logo.png"
      \setStroke 2
      \setRadius 30

    content\addContentChild r_next

    content\addSlideChild s1_idx, button_ex1_1
    content\addSlideChild s1_idx, button_ex1_2
    content\addSlideChild s2_idx, button_ex2_1
    content\addSlideChild s2_idx, button_ex2_2
    content\addSlideChild s3_idx, button_ex3_1
    content\addSlideChild s3_idx, button_ex3_2
    content\addSlideChild s3_idx, sides_inc

    root\addChild content



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
