class ListNode: Equatable {
  static func == (lhs: ListNode, rhs: ListNode) -> Bool {
    return lhs.value == rhs.value && lhs.next == rhs.next
  }
  
  var value: Int
  var next: ListNode?
  init(value: Int) {
    self.value = value
    self.next = nil
  }
}

class LinkedList {
  var head: ListNode?
  var tail: ListNode?
  private(set) var count: Int
  
  init() {
    self.head = nil
    self.tail = nil
    self.count = 0
  }
  
  func insertFirstPosition(_ value: Int) {
    let node = ListNode(value: value)
    self.count += 1
    if self.head == nil {
      self.head = node
      self.tail = node
      return
    }
    let currentHead = self.head
    self.head = node
    self.head?.next = currentHead
  }
  
  func insertLastPosition(_ value: Int) {
    let node = ListNode(value: value)
    self.count += 1
    if self.tail == nil {
      self.head = node
      self.tail = node
      return
    }
    let currentTail = self.tail
    currentTail?.next = node
    self.tail = node
  }
  
  func insertAtNPosition(_ value: Int, _ n: Int) {
    let node = ListNode(value: value)
    var currentCount = 0, currentNode = self.head, previousNode: ListNode?, indexFound = false
    while (currentNode != nil) {
      if (currentCount == n) {
        indexFound = true
        previousNode?.next = node
        node.next = currentNode
        break
      }
      currentCount += 1
      previousNode = currentNode
      currentNode = currentNode?.next
    }
    indexFound ? self.count += 1 : print("Erro para inserir o valor \(value). O índice a inserir deve estar entre 0 e \(self.count - 1)")
  }
  
  func deleteFirstPosition() {
    if (self.head == nil) {
      print("Não existe nenhum elemento na lista para deletar")
      return
    }
    self.head = self.head?.next
    self.count -= 1
  }
  
  func deleteLastPosition() {
    var currentNode = self.head
    while (currentNode != nil) {
      if (currentNode?.next == self.tail) {
        self.tail = currentNode
        self.tail?.next = nil
        break
      }
      currentNode = currentNode?.next
    }
    self.count -= 1
  }
  
  func deleteAtNPosition(_ value: Int, _ n: Int) {
    let node = ListNode(value: value)
    var currentCount = 0, elementFound = false, currentNode = self.head, previousNode: ListNode?
    while (currentNode != nil) {
      if (currentCount == n) {
        elementFound = true
        previousNode?.next = node
        node.next = currentNode
        break
      }
      currentCount += 1
      previousNode = currentNode
      currentNode = currentNode?.next
    }
    elementFound ? self.count -= 1 : print("Não foi encontrado nenhum elemento para remoção no índice \(n)")
  }
  
  func updateFirstPosition(_ value: Int) {
    if (self.head == nil) {
      print("Não existe nenhum elemento na lista para atualizar")
      return
    }
    self.head?.value = value
  }
  
  func updateLastPosition(_ value: Int) {
    self.tail?.value = value
  }
  
  func updateAtNPosition(_ value: Int, _ n: Int) {
    var currentCount = 0, elementFound = false
    var currentNode = self.head
    while (currentNode != nil) {
      if (currentCount == n) {
        elementFound = true
        currentNode?.value = value
        break
      }
      currentCount += 1
      currentNode = currentNode?.next
    }
    if !elementFound {
      print("Não foi encontrado nenhum elemento para atualização no índice \(n)")
    }
  }
  
  func findElementAtIndex(_ n: Int) -> Int? {
    var currentNode = self.head, currentCount = 0
    while(currentNode != nil) {
      if (currentCount == n) {
        return n
      }
      currentCount += 1
      currentNode = currentNode?.next
    }
    return nil
  }
  
  func firstIndexOfElement(_ value: Int) -> Int {
    var currentNode = self.head, currentCount = 0
    while(currentNode != nil) {
      if (currentNode?.value == value) {
        return currentCount
      }
      currentCount += 1
      currentNode = currentNode?.next
    }
    return -1
  }
  
  func printList() {
    var str: String, currentNode = self.head
    while (currentNode != nil) {
      str += (String(currentNode!.value)) + (String((currentNode?.next != nil) ? " -> " : ""))
      currentNode = currentNode?.next
    }
    print(str)
  }
  
  func getListLength() -> Int {
    return self.count
  }
  
  func isEmpty() -> Bool {
    return self.count == 0
  }
  
}

let linkedList = LinkedList()
print(linkedList.isEmpty())
linkedList.insertFirstPosition(8)
linkedList.insertFirstPosition(4)
linkedList.insertFirstPosition(10)
linkedList.insertFirstPosition(6)
linkedList.insertFirstPosition(3)
linkedList.insertFirstPosition(2)
linkedList.insertAtNPosition(50, 10)
linkedList.deleteLastPosition()
print(linkedList.getListLength())
print(linkedList.isEmpty())
print(linkedList.firstIndexOfElement(2))
print(linkedList.findElementAtIndex(3))
linkedList.printList()

