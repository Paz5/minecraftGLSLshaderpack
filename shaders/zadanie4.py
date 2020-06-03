dt = 0.05
r = 5
T = 12.5
ts = 3

float x = r * sin(2*PI/T + ts)
float y = r * cos(2*PI/T + ts)

t = 0

for(;x<y;t+=dt):
	float x = r * sin(2*PI/T + ts + t)
	float y = r * cos(2*PI/T + ts + t)

print(x)
print(y)
print(t)
