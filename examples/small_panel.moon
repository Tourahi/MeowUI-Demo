Button = assert require MeowUI.c_cwd .."Button"
Label = assert require MeowUI.c_cwd .."Label"
TextInput = assert require MeowUI.c_cwd .."TextInput"
Content = assert require "MeowUI.Controls.Content"
manager = MeowUI.manager

Panel = {}

with Panel
  .new = (name, pos, size, root = manager\getRoot!) ->

    contentArea = Content "Panel_cntnt"
    toolbar = Content "Panel_bar"
    closeBtn = Button "Box"
    toolbarTitle = Label 14, name
    toolbarH = 25
    txt = TextInput!
    
    with contentArea
      \setPosition pos[1], pos[2]
      \setSize size[1], size[2]
      \setDepth 20

    with toolbar
      \setPosition 0, 0
      \setSize size[1], toolbarH
      \setBackgroundColor {0.161, 0.29, 0.478}
      \setDrag false, false

    with toolbarTitle
      \setPosition 5, 5

    with closeBtn
      \setLabel "Panel_closeBtn"
      \setPosition 230, 5
      \setSize 18, 18
      \setImage "assets/cross.png", true
      \setStroke 0
      \onClick ->
        contentArea\destruct root

    toolbar\addSlideChild 1, closeBtn
    toolbar\addSlideChild 1, toolbarTitle
    contentArea\addSlideChild 1, toolbar

    root\addChild contentArea




Panel