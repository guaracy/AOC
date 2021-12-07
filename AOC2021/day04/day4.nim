import sequtils, strutils

var
    numeros : seq[int]
    linhas  : seq[string]
    cartelaOk  : seq[int]     
    nc      : int

proc inicializa(s:seq[string]):seq[string] =
    result = s
    result.keepItIf(it != "")
    numeros = result[0].split(",").map(parseInt)
    result.delete(0)

proc geraCartela(s:seq[string]) : seq[seq[int]] =
    var cartela : seq[string]
    for c in s:
        cartela = c.split
        cartela.keepItIf(it != "")
        result.add(cartela.map(parseInt))
    nc = result.len div 5 # número de cartelas

proc SolveParte1(cartela:int,cartelas:seq[seq[int]]):int =
    var 
        c = cartela*5
    for i in 0..4:
        for n in cartelas[c+i]:
            if n > 0:
                result += n

proc sorteio(s:seq[string],todos:bool=false) : int =
    var 
        wonl,wonc:bool
        win     : seq[seq[int]]
        dummy = newSeq[int](5)
        cartelas: seq[seq[int]]
    cartelas = geraCartela s
    cartelaOk = newSeq[int](nc)
    for _ in 0..<nc:
        win.add(dummy)
        win.add(dummy)
    for ix,nm in numeros:
        var cartela, ln : int
        for lin,linha in cartelas:
            for col, numero in linha:
                if nm == numero:
                    cartelas[lin][col] *= -1
                    cartela=lin div 5
                    ln = lin mod 5
                    win[cartela*2][col].inc # coluna
                    wonc = win[cartela*2][col] == 5
                    win[cartela*2+1][ln].inc # linha
                    wonl = win[cartela*2+1][ln] == 5
                if wonl or wonc:
                    cartelaOk[cartela].inc
                    if todos:
                        if  cartelaOk.all(proc(x:int):bool = x > 0):
                            return nm * SolveParte1(cartela, cartelas)
                    else:
                        return nm * SolveParte1( cartela, cartelas)

echo "Sample"
linhas = inicializa( "day4.sample".strip.lines.toSeq)
echo sorteio(linhas)
echo sorteio(linhas,true)

echo "\nData"
linhas = inicializa( "day4.data".strip.lines.toSeq)
echo sorteio(linhas)
echo sorteio(linhas,true)
