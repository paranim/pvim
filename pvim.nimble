# Package

version       = "0.18.5"
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

requires "nim >= 1.2.6"
requires "paravim >= 0.18.5"
