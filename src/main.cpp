#include <iostream>
#include <egl_simulator/simulator.h>
#include <string>

vec3 eye{1.409999966621399, 1.3399996757507324, 1.0799999237060547},
    front{-0.5281172394752502, 0.8262654542922974, 0.19590270519256592},
    up{0.1055038720369339, -0.16506606340408325, 0.9806234836578369};

int main(int argc, char *argv[]) {
  std::string vertex_shader = "/home/vrlab/nolf/simulator/src/vertex.glsl",
              fragment_shader = "/home/vrlab/nolf/simulator/src/fragment.glsl",
              mesh_path = "/home/vrlab/siggraph/scene3_colored_simplified.ply";
  egl_simulator::Simulator simulator(1920 / 4, 1080 / 4, vertex_shader, fragment_shader,
                                     mesh_path);

  auto view = glm::lookAt(eye, eye + front, up);
  auto pro = glm::perspective(0.6911112f, 16.0f / 9.0f, 0.1f, 100.0f);
    simulator.switch_debug();
  simulator.draw(pro, view);
  return 0;
}