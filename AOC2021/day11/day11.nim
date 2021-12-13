import std/[sequtils, strutils]

type
    Tboard = seq[seq[int]]
var 
    data, board : Tboard
    W,H : int
    
proc setBoard(f:string) =
    var s = readFile(f).splitLines
    W = s[0].high
    H = s.high
    data = newSeqWith(H+1, newSeq[int](W+1))
    for l in 0 .. H:
        for c in 0 .. W:
            data[l][c] = s[l][c].ord-48

proc adjacent(l,c:int) =
    proc flash(l,c:int):bool =
        if l < 0 or c < 0 or c > W or l > H or board[l][c] == 88:
            return
        if board[l][c] < 10:
            board[l][c].inc
        if board[l][c] == 10:
            board[l][c] = 88
            adjacent(l,c)
    #
    discard flash(l-1,c)
    discard flash(l-1,  c-1)
    discard flash(l-1,c+1)
    discard flash(l,c-1)
    discard flash(l,c+1)
    discard flash(l+1,c-1)
    discard flash(l+1,c)
    discard flash(l+1,c+1)

proc adjustBoard():int =
    for l in 0 .. H:
        for c in 0 .. W:
            if board[l][c] == 88:
                board[l][c] = 0
                inc result

proc solvePart1(steps:int):int =
    board = data
    for s in 1 .. steps:
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    continue
                if board[l][c] < 10:
                    board[l][c].inc
                if board[l][c] == 10:
                    board[l][c] = 88
                    adjacent(l,c)
        result += adjustBoard()

proc solvePart2:int =
    board = data
    while true:
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    continue
                if board[l][c] < 10:
                    board[l][c].inc
                if board[l][c] == 10:
                    board[l][c] = 88
                    adjacent(l,c)
        discard adjustBoard()
        inc result
        if board.allIt(it.allIt(it == 0)):
            break;

setBoard "day11.sample"
echo "Sample"
echo "parte 1 : ",solvePart1(100)
echo "parte 2 : ",solvePart2()

echo "\nData"
setBoard "day11.data"
echo "parte 1 : ",solvePart1(100)
echo "parte 2 : ",solvePart2()

#setBoard "day11.sample"
#assert solvePart1(100) == 1656
#assert solvePart2() == 195
#setBoard "day11.data"
#assert solvePart1(100) == 1585
#assert solvePart2() == 382


