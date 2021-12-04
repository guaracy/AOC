import sequtils, strutils

var
  data, newData : seq[int]

# Parte 1
func countIncrease(s: seq[int]): int =
  for idx in 1 .. s.high:
    if s[idx] > s[idx - 1]:
      inc result

# Parte 2
func threeMeasurement(s: seq[int]): seq[int] =
  for ix in 0 .. s.high-2:
    result.add s[ix .. ix+2].foldl(a + b)

proc solveProblem(s1,s2:seq[int]) =
  echo "Part 1 : ",data.countIncrease
  echo "Part 2 : ",newData.countIncrease

echo "Sample"
data = "day1.sample".lines.toSeq.map(parseInt)
newData = data.threeMeasurement
solveProblem data, newData

echo "\nData"
data = "day1.data".lines.toSeq.map(parseInt)
newData = data.threeMeasurement
solveProblem data, newData
