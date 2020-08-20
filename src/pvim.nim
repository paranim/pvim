import nimgl/glfw
from paranim/gl import nil
from paravim import nil
from paravim/terminal import nil
from os import nil
from strutils import nil

proc runGui(params: seq[string]) =
  doAssert glfwInit()

  glfwWindowHint(GLFWContextVersionMajor, 3)
  glfwWindowHint(GLFWContextVersionMinor, 3)
  glfwWindowHint(GLFWOpenglForwardCompat, GLFW_TRUE) # Used for Mac
  glfwWindowHint(GLFWOpenglProfile, GLFW_OPENGL_CORE_PROFILE)
  glfwWindowHint(GLFWResizable, GLFW_TRUE)
  glfwWindowHint(GLFWTransparentFramebuffer, GLFW_TRUE)

  let w: GLFWWindow = glfwCreateWindowC(1024, 768, "Paravim", nil, nil)
  if w == nil:
    quit(-1)

  w.makeContextCurrent()
  glfwSwapInterval(1)

  discard w.setKeyCallback(paravim.keyCallback)
  discard w.setCharCallback(paravim.charCallback)
  discard w.setMouseButtonCallback(paravim.mouseButtonCallback)
  discard w.setCursorPosCallback(paravim.cursorPosCallback)
  discard w.setFramebufferSizeCallback(paravim.frameSizeCallback)
  discard w.setScrollCallback(paravim.scrollCallback)

  w.setCursor(glfwCreateStandardCursor(GLFW_IBEAM_CURSOR))

  var game = gl.RootGame()
  paravim.init(game, w, params)

  while not w.windowShouldClose:
    let mustPoll = paravim.tick(game, true)
    w.swapBuffers()
    if mustPoll:
      glfwPollEvents()
    else:
      glfwWaitEvents()

  w.destroyWindow()
  glfwTerminate()

proc runTerminal() =
  terminal.init()
  while true:
    terminal.tick()
    os.sleep(20)

when isMainModule:
  var
    params = newSeq[string]()
    guiMode = true
  for param in os.commandLineParams():
    if strutils.startsWith(param, "--"):
      if param == "--terminal":
        guiMode = false
      else:
        quit("Unrecognized parameter: " & param)
    else:
      params.add(param)

  if guiMode:
    runGui(params)
  else:
    runTerminal()
