z1 = 20, z2 = 45, z3 = 24, z4 = 55, z5 = 30, z6 = 43, z7 = 15, z8 = 53
t1 = [z1, z3, z5, z7];
t2 = [z2, z4, z6, z8];
ratios = t1 ./ t2
speed = 3600
prod(ratios) * speed