[Problema](https://adventofcode.com/2021/day/2)

Existia uma maneira interessante de resolver o problema as deveriam ser feitos dois programas para a resolução. 

A primeira parte ficaria:

```nim
var x,y = 0

proc forward(a:int) = x+=a
proc up(a:int) =      y-=a
proc down(a:int) =    y+=a

include "day2.sample"

echo "Part 1 : ", x * y
```

E a segunda:

```nim
var x,y,aim = 0

proc forward(a:int) = 
    x+=a
    y+=(aim*a)
    
proc up(a:int) =      
    aim-=a

proc down(a:int) =    
    aim+=a

include "day2.data"

echo "Part 2 : ", x * y
```