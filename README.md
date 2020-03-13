<p align="center">
  <img src="screenshot.png" width="510" >
</p>

Paravim (or pvim) is an editor for Nim powered by Vim (via [libvim](https://github.com/paranim/libvim)) and rendered with OpenGL (via [paranim](https://github.com/paranim/paranim)). This repo is for the main executable; most of the code is in a [separate library](https://github.com/paranim/paravim) for reusability.

To use it, [install Nim](https://nim-lang.org/install.html) and do:

```
nimble install pvim
```

Then, as long as you have `~/.nimble/bin` on your PATH, you should be able to run `pvim` in any directory.

A few notes for linux users:

1. On Ubuntu, if pvim fails to build, you may need to install X11 and OpenGL related libraries with `sudo apt install xorg-dev libgl1-mesa-dev`
2. On Ubuntu, if pvim fails to load, try `sudo apt install libtinfo5`
3. On Arch, if pvim fails to load, you may need to do `sudo ln -s /usr/lib/libtinfo.so.6 /usr/lib/libtinfo.so.5`
