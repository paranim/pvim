import nimgl/glfw
from paranim/gl import nil
from paravim import nil
from os import nil

when isMainModule:
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

  var game = gl.RootGame()
  let params = os.commandLineParams()
  paravim.init(game, w, params)

  while not w.windowShouldClose:
    paravim.tick(game, true)
    w.swapBuffers()
    glfwPollEvents()

  w.destroyWindow()
  glfwTerminate()
