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
    panel.new "Examples", {love.graphics.getWidth! - 250, 0}, {250, love.graphics.getHeight!}

    Graphics.setBackgroundColor 0.2, 0.2, 0.2

    export manager = MeowUI.manager



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
