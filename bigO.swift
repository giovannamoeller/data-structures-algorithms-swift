import Foundation

func generateArray(_ numberOfElements: Int) -> [Int] {
  var array: [Int] = []
  for i in 1...numberOfElements {
    array.append(i)
  }
  return array
}

mesurePerformance(1, func1)
mesurePerformance(2, func2)
mesurePerformance(3, func3)

func mesurePerformance(_ functionNumber: Int, _ function: ([Int]) -> Int) {
  let array = generateArray(1000)
  let startTime = CFAbsoluteTimeGetCurrent()
  function(array)
  let endTime = CFAbsoluteTimeGetCurrent()
  print("Tempo de execução para a função \(functionNumber): \(endTime - startTime) milisegundos")
}

func func1(array: [Int]) -> Int {
  return 1 + array[0]
}

func func2(array: [Int]) -> Int {
  var sum = 0
  for i in 0..<array.count {
    sum += array[i]
  }
  return sum
}

func func3(array: [Int]) -> Int {
  var pairs: [[Int]] = []
  for i in 0..<array.count {
    for j in i..<array.count {
      pairs.append([array[i], array[j]])
    }
  }
  return pairs.count
}
\