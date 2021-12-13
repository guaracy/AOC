import  sequtils, strutils,algorithm

var 
    data : seq[string]
    points =  [0,3,57,1197,25137]
    autocomplete = [1,2,3,4]

let
    openChar = "([{<"
    closeChar = ")]}>"

proc checkLine(line:string,part2:bool=false):int =
    var 
        openIdx, closeIdx : int
        stk : seq[char] = @[]
    for c in line:
        openIdx = openChar.find(c)
        if  openIdx >= 0:
            stk.add(c)
        else:
            openIdx = openChar.find(stk[^1])
            closeIdx = closeChar.find(c)
            if closeIdx == openIdx:
                discard stk.pop
            else:
                if part2:
                    return 0
                else:
                    return points[closeIdx+1]
    if part2:
        result = 0
        for c in 1..stk.len:
            result = result * 5 + autocomplete[openChar.find(stk.pop)]
    else:
        result = 0


proc soluciona(s:seq[string],part2:bool=false):int =
    var scores : seq[int] = @[]
    for l in s:
        if part2:
            scores.add(checkLine(l,part2))
            scores.keepItIf(it > 0)
            scores.sort
        else:
            result += checkLine(l)
    if part2:
        result = scores[scores.len div 2]

echo "Sample"
data = "day10.sample".lines.toSeq
echo soluciona(data)
echo soluciona(data,true)

echo "\nData"
data = "day10.data".lines.toSeq
echo soluciona(data)
echo soluciona(data,true)
