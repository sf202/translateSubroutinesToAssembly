# translateSubroutinesToAssembly

Objective: To learn how to write subroutines, to represent variables/arguments in the stack, to load and store data from and into the stack and the main memory, to read and write data from and into the I/O, and to use gdb.
Requirements:

1. Translate the following three subroutines into assembly language.

main()

{

fn(1,3,2,4,8,6,5);

}


fn(int a, b, c, d, e, f, g)

{

register int x, y, z;

x = a + b*c

y = d - e / f;

z = power(x, g);

return x + y + z;

}

power(int base, int exponent)

{

register int p, e;

p = 1;

for(int e=1; e <= exponent; e++)

{

p *= base;

}

}
Note:

 DO NOT use macros (begin_main, end_main, var, local_var) given in text book. You should calculate offsets for stack variables manually.

 DO NOT try to optimize your code (i.e. remove nops)
