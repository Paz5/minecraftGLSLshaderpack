#version 120

#include "lib/framebuffer.glsl"

varying vec4 texCoord;

void main(){
	vec4 color = texture2D(gcolor,texCoord.st);
	gl_FragColor = color;
}