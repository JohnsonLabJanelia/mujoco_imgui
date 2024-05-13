mkdir -p targets;
rm -f targets/mujoco_imgui;
DIR_IMGUI="third_party/imgui"
DIR_MUJOCO=$HOME"/build/mujoco-3.1.3/"

g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui.o ./third_party/imgui/imgui.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_demo.o ./third_party/imgui/imgui_demo.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_draw.o ./third_party/imgui/imgui_draw.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_tables.o ./third_party/imgui/imgui_tables.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_widgets.o ./third_party/imgui/imgui_widgets.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_impl_glfw.o ./third_party/imgui/backends/imgui_impl_glfw.cpp
g++ -std=c++11 -I./third_party/imgui -I./third_party/imgui/backends -g -Wall -Wformat `pkg-config --cflags glfw3` -c -o targets/imgui_impl_opengl3.o ./third_party/imgui/backends/imgui_impl_opengl3.cpp

g++ -Ofast -ffast-math -std=c++17 \
    -o targets/*.o \
    -o targets/mujoco_imgui src/main.cpp include/glad/gl.cpp src/FrameBuffer.cpp\
    -I include \
    -L$DIR_MUJOCO/lib \
    -I$DIR_MUJOCO/include/mujoco \
    -I$DIR_MUJOCO/include/ \
    -lmujoco \
    -I/usr/local/include/ -I./third_party/imgui -I./third_party/imgui/backends -lGLEW -lGLU -lGL `pkg-config --static --libs glfw3`

./targets/mujoco_imgui