import sequtils, strutils

var
    data : seq[seq[int]]
    fold : seq[seq[string]]

proc initData(f:string) =
    var
        pointsFlag = true
    data = @[]
    fold = @[]
    for line in lines f: 
        if line.isEmptyOrWhitespace:
            pointsFlag = false
            continue
        if pointsFlag:
            data.add(line.split(",").map(parseInt))
        else:
            fold.add(line.split("="))

proc foldAlong(f:seq[string]):int =
    var 
        x = 0
        y = 0
        v = 0
    v = f[1].parseInt
    if f[0].endsWith("x"):
        x = v
    else:
        y = v
    for i in 0 .. data.high:
        if x != 0 and data[i][0] >= x:
            data[i][0] = 2 * x - data[i][0]
        if y != 0 and data[i][1] >= y:
            data[i][1] = 2 * y - data[i][1]
    result = data.deduplicate.len

proc part2() =
    var x, y : int
    for i in 1 .. fold.high:
        discard foldAlong(fold[i])
        data = data.deduplicate
    for i in 0 .. data.high:
        x = max(x,data[i][0])
        y = max(y,data[i][1])
    var grid = newSeqWith(y+1,' '.repeat(x+1))
    for p in data:
        grid[p[1]][p[0]] = '#'
    for l in grid:
        echo l

echo "Sample"
initData "day13.sample"
echo "Part 1: ",foldAlong(fold[0])
echo "Part 2:"
part2()

echo "\nData"
initData "day13.data"
echo "Part 1: ",foldAlong(fold[0])
echo "Part 2:"
part2()
