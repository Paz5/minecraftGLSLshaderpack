#define GCOLOR_OUT 		gl_FragData[0]
#define GNORMAL_OUT 	gl_FragData[2]
#define GDEPTH_OUT 		gl_FragData[3]

uniform sampler2D gcolor;
uniform sampler2D gnormal;
uniform sampler2D gdepth;

const int	RGBA16 			= 1;
const int 	gcolorFormat 	= RGBA16;

vec4 getAlbedo(in vec2 coord){
	return texture2D(gcolor,coord);
}

vec4 getNormal(in vec2 coord){
	return texture2D(gnormal,coord)*2.0 - 1.0;
}

float getEmission(in vec2 coord){
	return texture2D(gdepth,coord).a;
}