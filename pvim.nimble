# Package

version       = "0.4.0"
author        = "oakes"
description   = "A parasitic editor"
license       = "Public Domain"
srcDir        = "src"
installExt    = @[
  when defined(windows):
    "dll"
  elif defined(macosx):
    "dylib"
  elif defined(linux):
    "so"
]
bin           = @["pvim"]

task dev, "Run dev version":
  exec "nimble run pvim"

# Dependencies

requires "nim >= 1.0.6"
requires "paravim >= 0.4.0"
