#version 120

varying vec4 texCoord;

void main(){
	gl_Position = ftransform();
	texCoord = gl_MultiTexCoord0;
}