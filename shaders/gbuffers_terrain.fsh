#version 120

uniform sampler2D texture;

float gridwidth = .03;

varying vec4 color;
varying vec4 texcoord;
varying vec4 vertexPos;
varying vec3 normal;
varying vec3 viewPos;
uniform float frameTimeCounter;

void main(){
	vec4 blockColor = texture2D(texture,texcoord.st);
	float upScalar =  max(0,dot(normal,vec3(0.0,1.0,0.0)));
	float gridx = min(gridwidth,fract((vertexPos.x+gridwidth/2)/8));
	float gridz = min(gridwidth,fract((vertexPos.z+gridwidth/2)/8));
	if (gridx < gridwidth){
		gridx = 1;
	}else{
		gridx = 0;
	}

	if (gridz < gridwidth){
		gridz = 1;
	}else{
		gridz = 0;
	}

	vec4 grid = fract((vertexPos+gridwidth/2)/8);
	grid = vec4(min(gridwidth,grid.x),min(gridwidth,grid.y),min(gridwidth,grid.z),1.0);

	if(length(grid) <= gridwidth){
		grid = vec4(1);
	}else{
		grid = vec4(0);
	}

	gl_FragData[0] =  (grid);// + color * blockColor;
}