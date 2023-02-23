#version 460 core
layout (location=0) in vec4 aPos;
uniform mat4 transform;
uniform mat4 model_matrix;

out float label;

void main() {
    gl_Position = transform * vec4(aPos.x, aPos.y, aPos.z, 1.0);
    // normal = (model_matrix * vec4(aNormal.x, aNormal.y, aNormal.z, 0.0)).xyz;
    // pos = (model_matrix * vec4(aPos.x, aPos.y, aPos.z, 1.0)).xyz;
    label = aPos.w;
}
