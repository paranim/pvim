# Package

version       = "0.2.0"
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



# Dependencies

requires "nim >= 1.0.6"
requires "paravim >= 0.2.0"
