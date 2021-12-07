[Problema](https://adventofcode.com/2021/day/6)

A rotina inicial foi bem fácil

```nim
proc crescimento(s:seq[int],days:int):int =
    var peixes = s
    for d in 0..<days:
        for p in 0..peixes.high:
            if peixes[p] == 0:
                peixes[p] = 6
                peixes.add(8)
            else:
                peixes[p].dec
    result = peixes.high+1
```

Com 5 peixes, resolveu o problema para 18 e 80 dias. Para a parte dois que pedia 256 dias a rotina se mostrou impraticável. Só um Ctrl+C para finalizar. A solução foi refazer o algoritmo que resultou em um tempo muito bom. 

```bash
❯ time ./day6
Sample
18 days: 26
80 days: 5934
256 day: 26984457539

Data
80 days: 372300
256 day: 1675781200288
./day6  0,00s user 0,00s system 82% cpu 0,001 total
```
