import sequtils, strutils

# Parte 1
func countIncrease(s: seq[int]): int =
  for idx in 1 .. s.high:
    if s[idx] > s[idx - 1]:
      inc result

# Parte 2
func threeMeasurement(s: seq[int]): seq[int] =
  for ix in 0 .. s.high-2:
    result.add s[ix .. ix+2].foldl(a + b)

# Solve
proc solvePuzzle(s:seq[int]) =
  echo "Part 1 = ",s.countIncrease
  echo "Part 2 = ",s.threeMeasurement.countIncrease

var 
  data = "day1.sample".lines.toSeq.map(parseInt)

echo "Sample"
solvePuzzle data

data = "day1.data"
  .lines
  .toSeq
  .map parseInt

echo "\nData"
solvePuzzle data
