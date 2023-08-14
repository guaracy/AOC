[Problema](https://adventofcode.com/2021/day/2)

Existia uma maneira interessante de resolver o problema mas deveriam ser feitos dois programas para a resolução. 

A primeira parte ficaria:

```nim
var x,y = 0

proc forward(v:int) = x+=v
proc up(v:int)      = y-=v
proc down(v:int)    = y+=v

include "day2.sample"

echo "Part 1 : ", x * y
```

E a segunda:

```nim
var x,y,aim = 0

proc forward(v:int) = x+=v; y+=(aim*v)
proc up(v:int)      = aim-=v
proc down(v:int)    = aim+=v

include "day2.data"

echo "Part 2 : ", x * y
```
