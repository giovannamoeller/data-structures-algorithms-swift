// O(Nˆ^2)

func twoSumQuadracticComplexity(_ array: [Int], _ target: Int) -> (Int, Int) {
  for i in 0..<array.count {
    for j in (i + 1)..<array.count {
      if array[i] + array[j] == target {
        return (i, j)
      }
    }
  }
  return (-1, -1)
}

// O(N)

func twoSumLinearComplexity(_ array: [Int], _ target: Int) -> (Int, Int) {
  var hash: [Int: Int] = [:]
  for i in 0..<array.count {
    let elementToBeFound = target - array[i]
    if hash.keys.contains(elementToBeFound) {
      if let hashIndex = hash[array[i]] {
        return (i, hashIndex)
      }
    }
    hash[array[i]] = i
  }
  return (0, 0)
}

let array = [2, 7, 11, 15]
let target = 9
twoSumQuadracticComplexity(array, target)
twoSumLinearComplexity(array, target)

