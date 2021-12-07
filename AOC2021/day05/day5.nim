import sequtils, strutils, math

var
    mx,my:int

proc procLinhas(s:seq[string],parte2:bool=false):seq[seq[int]] =
    var
        pxy:seq[string]
        p1,p2:seq[int]
        dx,dy:int
        flag:bool
    for l in s:
        pxy = l.split(sep=" -> ")
        p1 = pxy[0].split[0].split(",").map(parseInt)
        p2 = pxy[1].split[0].split(",").map(parseInt)
        flag = p1[0] == p2[0] or p1[1] == p2[1]
        if parte2:
            dx =abs(p1[0]-p2[0])
            dy =abs(p1[1]-p2[1])
            if dx == dy:
                flag = true
        if flag:
            mx = max(mx,max(p1[0],p2[0]))
            my = max(mx,max(p1[1],p2[1]))
            result.add(@[p1,p2])

func plota(mx,my:int,pontos:seq[seq[int]]):int =
    var
        x,y,x1,y1,x2,y2,ix,iy:int
        board = newSeqWith[mx+1,newSeq[int](my+1)]
    for i in countup(0,pontos.high-1,2):
        x1 = pontos[i][0]
        y1 = pontos[i][1]
        x2 = pontos[i+1][0]
        y2 = pontos[i+1][1]
        ix = sgn(x2-x1)
        iy = sgn(y2-y1)
        board[x1][y1].inc
        while (x1 != x2) or (y1 != y2):
            x1+=ix
            y1+=iy
            board[x1][y1].inc
    for y in 0..my:
        for x in 0..mx:
            if board[x][y]>1:
                result.inc

var linhas = "day5.sample".strip.lines.toSeq
var pontos = procLinhas(linhas)
echo plota(mx,my,pontos)

linhas = "day5.data".strip.lines.toSeq
pontos = procLinhas(linhas)
echo plota(mx,my,pontos)

pontos = procLinhas(linhas,true)
echo plota(mx,my,pontos)
