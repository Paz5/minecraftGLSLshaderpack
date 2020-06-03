#version 120

uniform sampler2D texture;

float gridwidth = .02;
vec4 offset = vec4(.5);
int scale = 16;

varying vec4 color;
varying vec4 texcoord;
varying vec4 vertexPos;
varying vec3 normal;
varying vec3 viewPos;
uniform float frameTimeCounter;
uniform int worldTime;

void main(){
	vec4 blockColor = texture2D(texture,texcoord.st);

	vec4 grid = fract((vertexPos/scale+vec4(gridwidth)/2 + vec4(offset)/scale));
	grid.x = min(gridwidth,grid.x);
	grid.y = min(gridwidth,grid.y);
	grid.z = min(gridwidth,grid.z);
	if(grid.x < gridwidth){
		grid.x = 1;
	}else{
		grid.x= 0;
	}
	if(grid.y < gridwidth){
		grid.y = 1;
	}else{
		grid.y = 0;
	}
	if(grid.z < gridwidth){
		grid.z = 1;
	}else{
		grid.z = 0;
	}

	float gridtint = sin(worldTime*0.27/4 + vertexPos.x/4 + vertexPos.z/4)*.5 + .5;

	gl_FragData[0] =  min(1,(grid.x+grid.y+grid.z))*gridtint + color * blockColor;
}