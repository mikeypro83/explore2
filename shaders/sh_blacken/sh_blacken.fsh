varying vec4 v_vColour;
varying vec2 v_vTexcoord;
uniform float pixelH;
uniform float pixelW;

void main() {		
	vec2 offsetx; offsetx.x = pixelW;
	vec2 offsety; offsety.y = pixelH;
	float alpha = texture2D(gm_BaseTexture, v_vTexcoord).a;
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx + offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsetx - offsety).a);	
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx + offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsetx - offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord - offsety).a);
	alpha += ceil(texture2D(gm_BaseTexture, v_vTexcoord + offsety).a);	
	gl_FragColor = vec4(0.0,0.0,0.0,1.0) * texture2D(gm_BaseTexture, v_vTexcoord);	
	gl_FragColor.a = alpha;
}