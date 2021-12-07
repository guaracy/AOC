import sequtils, strutils

proc calculaConsumo(s:seq[int],parte2:bool=false):int =
    var 
        consumo:seq[int]
        ct:int
    for i in 0..<s.max:
        var t = 0
        for v in s:
            if parte2:
                ct = abs(v-i)
                t+=(ct+1)*ct div 2
            else:
                t += abs(v-i)
        consumo.add(t)
        #echo i," - ",t
        result = consumo.min


echo "Sample"
var data = readFile("day7.sample").strip.split(",").map(parseInt)
echo calculaConsumo(data)
echo calculaConsumo(data,true)

echo "\nData"
data = readFile("day7.data").strip.split(",").map(parseInt)
echo calculaConsumo(data)
echo calculaConsumo(data,true)
