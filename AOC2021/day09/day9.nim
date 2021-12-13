import sequtils, math

var 
    ok = @[false,false,false,false]

proc soluciona(s:seq[string]):int =
    var
        num : seq[int]
        maxCol = s[0].high
        maxRow =  s.high
    #echo s.len,"x",s[0].len
    for lx,l in s:
        for cx,c in l:
            if c == '9':
                continue
            # left
            if cx == 0: ok[0]=true
            else: ok[0]=c <= l[cx-1]
            # right
            if cx < maxCol: ok[1]=c <= l[cx+1]
            else: ok[1]=true
            # top
            if lx == 0: ok[2]=true
            else: ok[2]= c <= s[lx-1][cx]
            # bottom
            if lx < maxRow: ok[3]= c <= s[lx+1][cx]
            else: ok[3]=true
            #echo c,":",ok
            if ok.all(proc (x:bool):bool = x):
                num.add(int(c.byte-47))
        #echo  "----------"
    result = num.sum

echo "Sample"
var data = "day9.sample".lines.toSeq #.split(",").map(parseInt)
echo soluciona(data)

echo "\nData"
data = "day9.data".lines.toSeq #.split(",").map(parseInt)
echo soluciona(data)



#[
echo calculaConsumo(data)
echo calculaConsumo(data,true)

echo "\nData"
data = readFile("day7.data").split(",").map(parseInt)
echo calculaConsumo(data)
echo calculaConsumo(data,true)
]#