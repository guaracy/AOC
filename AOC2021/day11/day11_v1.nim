import std/[sequtils, strutils,sugar]

type
    Tboard = seq[seq[int]]
var
    data : Tboard
    W,H : int

proc prepareboard(f:string):Tboard =
    var
        s = readFile(f).splitLines
        W = s[0].high
        H = s.high
        d = newSeqWith(H+1, newSeq[int](W+1))
    for l in 0 .. H:
        for c in 0 .. W:
            d[l][c] = s[l][c].ord-48
    result = d

proc propaga(d:Tboard,l,c:int):Tboard =
    var board = d
    proc flash(l,c:int):bool =
        if l < 0 or c < 0 or c > W or l > H or board[l][c] == 88:
            return
        if board[l][c] < 10:
            board[l][c].inc
        if board[l][c] == 10:
            board[l][c] = 88
            board = propaga(board,l,c)
    discard flash(l-1,c)
    discard flash(l-1,  c-1)
    discard flash(l-1,c+1)
    discard flash(l,c-1)
    discard flash(l,c+1)
    discard flash(l+1,c-1)
    discard flash(l+1,c)
    discard flash(l+1,c+1)
    result = board

proc solvePart1(d:Tboard,steps:int):int =
    var board = d
    for s in 1 .. steps:
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    continue
                if board[l][c] < 10:
                    board[l][c].inc
                if board[l][c] == 10:
                    board[l][c] = 88
                    board = propaga(board,l,c)
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    board[l][c] = 0
                    result.inc

proc solvePart2(d:Tboard):int =
    var board = d
    while true:
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    continue
                if board[l][c] < 10:
                    board[l][c].inc
                if board[l][c] == 10:
                    board[l][c] = 88
                    board = propaga(board,l,c)
        for l in 0 .. H:
            for c in 0 .. W:
                if board[l][c] == 88:
                    board[l][c] = 0
        inc result
        if board.allIt(it.allIt(it == 0)):
            break;


data = prepareboard "day11.sample"
W = data[0].high
H = data.high
echo "Sample"
echo "parte 1 : ",solvePart1(data,100)
echo "parte 2 : ",solvePart2(data)

data = prepareboard "day11.data"
W = data[0].high
H = data.high
echo "\nData"
echo "parte 1 : ",solvePart1(data,100)
echo "parte 2 : ",solvePart2(data)
