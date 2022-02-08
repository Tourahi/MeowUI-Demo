assert require "MeowUI"


Button = assert require "MeowUI.Controls.Button"
Graphics = love.graphics

with love
  .load = ->
    Graphics.setBackgroundColor 0.109803921569, 0.145098039216, 0.156862745098

    export manager = MeowUI.manager

    root = manager\getRoot!

    btn = Button!
    with btn
      \setPos 100, 100
      \setEnabled true
      \setText "PRESS"
      \onClick =>
        @setText "Pressed"
      \onLeave =>
        @setText "Press"
      \onHover =>
        @setText "Hovered Dynamic"
      \onAfterClick =>
        @setText "Hovered"


    root\addCoreChild btn


  .update = (dt) ->
    manager\update dt


  .draw = ->
    manager\draw!

  .mousepressed = (x, y, button) ->
    manager\mousepressed x, y, button


  .keypressed = (key, is_r) ->
    manager\keypressed key, is_r


  .mousemoved = (x, y, button) ->
    manager\mousemoved x, y, button

  .mousereleased = (x, y, button) ->
    manager\mousereleased x, y, button

  .wheelmoved = (x, y) ->
    manager\wheelmoved x, y

  .keyreleased = (key) ->
    manager\keyreleased key

  .textinput = (text) ->
    manager\textinput text
