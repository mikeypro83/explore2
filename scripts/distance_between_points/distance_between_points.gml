// Typical distance between two vector calculation
x1 = argument[0];
y1 = argument[1];
x2 = argument[2];
y2 = argument[3];
d = ((x2 - x1) * (x2 - x1)) + ((y2 - y1) * (y2 - y1));
return sqrt(d);