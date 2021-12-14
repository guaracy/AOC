[Problema](https://adventofcode.com/2021/day/1)

### 14/12/2021

Basicamente tentei deixar o programa `day1.nim` mais legível. Não houve alterações no tamanho final do executável nem no tempo de execução.

O interessante vai para as linhas 20 e 25 do programa, encarregadas de processar o arquivo com os dados. Em uma linguagem como Pascal (entre outras) e até em Nim, a linha 20 ficaria assim:

```nim
data = map(toSeq(lines("day1.sample")),parseInt)
```

acho que a notação

```nim
data = "day1.sample".lines.toSeq.map(parseInt)
```

fica bem mais legível. Outras linguagem, onde o interpretador/compilador é mais burro, exigiriam parênteses após `line` e `toSeq`

A linha 25 é outra forma de escrever a linha 20, que considero ainda mais legível. Note mais uma vez que o compilador foi inteligente o suficiente para que eu não precisasse colocar um monte de parênteses (achando que "Lots of Irritating, Superfluous Parentheses", entre outros,  não se aplica apenas ao LISP)

```nim
data = "day1.data"
  .lines
  .toSeq
  .map parseInt
```

