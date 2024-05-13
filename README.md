# mujoco_imgui

![gui](image.png)


## Installation
1. Install OpenGL
```
sudo apt-get install libglfw3
sudo apt-get install libglfw3-dev
```
2. Build the project

Use `build.sh` script to build the project on a Linux machine. By default, it looks for `mujoco` in `$HOME"/build/mujoco-3.1.3/"`. If you installed mujoco in a different folder, please update `DIR_MUJOCO` in the build script. 
```
./build.sh
```


