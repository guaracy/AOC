import sequtils, strutils, math


proc crescimento(data:seq[int],days:int) : int =
    var fishes = newSeq[int](9)
    for f in data:
        fishes[f].inc
    for day in 1..days:
        var newfishes = newSeq[int](9)
        for ix in 0..fishes.high:
            if fishes[ix] == 0:
                continue
            if ix == 0:
                newfishes[8] = fishes[ix]
                newfishes[6] = fishes[ix]
            else:
                newfishes[ix-1] = newfishes[ix-1]+fishes[ix]
        fishes = newfishes
    result = fishes.sum


echo "Sample"
var data = readFile("day6.sample").strip.split(",").map(parseInt)
echo "18 days: ",crescimento(data,18)
echo "80 days: ",crescimento(data,80)
echo "256 day: ",crescimento(data,256)

echo "\nData"
data = readFile("day6.data").strip.split(",").map(parseInt)
echo "80 days: ",crescimento(data,80)
echo "256 day: ",crescimento(data,256)
