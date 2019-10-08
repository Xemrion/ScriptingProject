#version 440
#//////////////////////////////////////////////////////////


in vec3 frag_color;
in vec2 texture_coord_geo;
in vec3 Normal;
in vec3 fragPos;

out vec4 fragment_color;

uniform sampler2D texture_sampler;
uniform vec2 playerPos;
uniform vec2 leftTop;
uniform vec2 rightBottom;
#//////////////////////////////////////////////////////////

vec3 lightpos = vec3(0.0f, 0.0f, 3.0f);
vec3 ambient = vec3(1.0f, 1.0f, 1.0f) * 0.1;

vec3 normal = normalize(Normal);
vec3 lightDir = normalize(lightpos-fragPos);
float diff = max(dot(normal, lightDir), 0.0);
vec3 diffuse = diff*vec3(1.0f, 1.0f, 1.0f);

vec3 light = ambient+diffuse;
#//////////////////////////////////////////////////////////
void main () 
{
	if(length(fragPos.xy-playerPos) < 0.3)
	{
		fragment_color = vec4(0.0f, 0.0f, 0.5f, 1.0f);
	}
	else
	{
		fragment_color = vec4(0.0f, 0.5f, 0.0f, 1.0f);
	}
	for(int i = 0; i < 5; i++)
	{
		if(fragPos.x <= (leftTop.x + ((rightBottom.x/2.5)*i)+0.05) && fragPos.x >= (leftTop.x + ((rightBottom.x/2.5)*i)-0.05))
		{
			fragment_color = vec4(0.0f, 0.0f, 0.0f, 1.0f);
		}
		if(fragPos.y <= (leftTop.y + ((rightBottom.y/2.5)*i)+0.05) && fragPos.y >= (leftTop.y + ((rightBottom.y/2.5)*i)-0.05))
		{
			fragment_color = vec4(0.0f, 0.0f, 0.0f, 1.0f);
		}
	}

	//fragment_color = vec4(frag_color,1.0f) * vec4(light,1.0);
}