#version 460 core
#define HISTOGRAM_BINS 256

layout(std430, binding = 0) buffer Histogram
{
    uint histogram[HISTOGRAM_BINS];
};

uniform uint object_num;

in float label;
// in vec4 gl_FragCoord;
out vec4 color_a;

void main() {
    uint bin = int(label);
    // uint max_index = HISTOGRAM_BINS - (HISTOGRAM_BINS % object_num) - object_num;    
    // uint offset = int(gl_FragCoord.x);
    // offset = int(offset / object_num) * object_num;
    // offset = offset % max_index;
    // atomicAdd(histogram[bin + offset], 1);
    atomicAdd(histogram[bin], 1);
    color_a = vec4(0,0,0,0);
    // color_a = vec4(label / 255, label / 255, label / 255, 1.0);
}
