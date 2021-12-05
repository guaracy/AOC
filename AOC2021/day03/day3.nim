import sequtils, strutils, math

var    
    linhas : seq[string]
    half, nbits = 0

### Parte 1

proc contaBits(s:seq[string],b:int):seq[int]=
    result = newSeq[int](b)
    for linha in s:
        for ix,bit in linha:
            if bit=='1':
                result[ix].inc

proc gama(b:seq[int],half:int) : string =
    for nbits in b:
        if nbits >= half:
            result &= '1'
        else:
            result &= '0'

### Parte 2

proc oxygen(linhas:seq[string],b:int,invert:bool=false) : string =
    var
        linha = linhas
        bit : char
        numBits : seq[int]
        bSet, bReset : char

    for i in 0..<b:
        numBits = contaBits(linha,b)
        bSet = '1'
        bReset = '0'
        if invert:
            swap(bSet,bReset)
        if float(numBits[i]) >= linha.len / 2:
            bit = bSet
        else:
            bit = bReset
        linha.keepItIf(it[i] == bit)
        if linha.len == 1:
            return linha[0]
        if linha.len == 2:
            if invert: 
                bit = '0'
            linha.keepItIf(it[i+1] == bit)
            return linha[0]

# Solve

proc solveProblem =
    nbits = linhas[0].len
    half = linhas.len div 2
    let bitOn = contaBits(linhas,nbits)
    let gamaRate = gama(bitOn,half).parseBinInt
    let epsilonRate = 2 ^ nbits - 1 - gamaRate
    echo "power consumption: ", gamaRate * epsilonRate
    let ogr = oxygen(linhas,nbits).parseBinInt
    let co2 = oxygen(linhas,nbits,true).parseBinInt
    echo "life support rating: ", ogr * co2

linhas = "day3.sample".lines.toSeq
echo "Sample"
solveProblem()

linhas = "day3.data".lines.toSeq
echo "\nData"
solveProblem()
