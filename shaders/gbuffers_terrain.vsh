#version 120

varying vec4 color;
varying vec4 texcoord;
varying vec4 vertexPos;
varying vec3 normal;
varying vec3 viewPos;

void main(){
	gl_Position = ftransform();
	texcoord = gl_MultiTexCoord0;
	color = gl_Color;
	normal = gl_Normal;
	vertexPos = gl_Vertex;
	viewPos = (gl_ModelViewMatrix * vertexPos).xyz;
}