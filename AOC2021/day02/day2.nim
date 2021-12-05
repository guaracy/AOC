import sequtils, strutils

# Parte 1

proc solve1(s:seq[string]): int = 
    var x,y = 0
    for linha in s:
        var d = linha.split
        var v = d[1].parseInt
        case d[0]:
            of "forward": x+=v
            of "up":      y-=v
            of "down":    y+=v
    result = x * y

# Parte 2

proc solve2(s:seq[string]): int = 
    var x,y,aim = 0
    for linha in s:
        var d = linha.split
        var v = d[1].parseInt
        case d[0]:
            of "forward":
                x+=v
                y+=(aim*v)
            of "up":
                aim-=v
            of "down":
                aim+=v
    result = x * y

# Solve

proc solveProblem(s:seq[string]) =
    echo "Part 1 : ",s.solve1
    echo "Part 2 : ",s.solve2

echo "Sample"
var data = "day2.sample".lines.toSeq
solveProblem data

echo "Data"
data = "day2.data".lines.toSeq
solveProblem data
