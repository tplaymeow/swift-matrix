public struct Matrix<Element> {
  public let rows: Int
  public let columns: Int
  
  @usableFromInline
  internal var data: [Element]
  
  @usableFromInline
  internal init(rows: Int, columns: Int, data: [Element]) {
    self.rows = rows
    self.columns = columns
    self.data = data
  }
}

extension Matrix {
  @inlinable
  public init(rows: Int, columns: Int, repeating element: Element) {
    self.rows = rows
    self.columns = columns
    self.data = .init(repeating: element, count: rows * columns)
  }
}

extension Matrix {
  @inlinable
  public subscript(row: Int, column: Int) -> Element {
    _read {
      yield self.data[row * self.columns + column]
    }
    _modify {
      yield &self.data[row * self.columns + column]
    }
  }
}
