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
  public init(rows: Int, columns: Int, elements: [Element]) throws {
    guard elements.count == rows * columns else {
      throw MatrixError(description: "Elements count must be equal to rows*colums")
    }

    self.rows = rows
    self.columns = columns
    self.data = elements
  }
}

extension Matrix {
  @inlinable
  public init<C>(rows: Int, columns: Int, elements: C) throws
  where C: Collection, C.Element == Element {
    guard elements.count == rows * columns else {
      throw MatrixError(description: "Elements count must be equal to rows*colums")
    }

    self.rows = rows
    self.columns = columns
    self.data = .init(elements)
  }
}

extension Matrix {
  @inlinable
  public init(rows: [[Element]]) throws {
    guard let firstRowCount = rows.first?.count else {
      throw MatrixError(description: "Rows must be not empty")
    }

    let data = try rows.flatMap {
      guard $0.count == firstRowCount else {
        throw MatrixError(description: "All rows must be equal size")
      }
      return $0
    }

    self.rows = rows.count
    self.columns = firstRowCount
    self.data = data
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

extension Matrix {
  @inlinable
  public var isSquare: Bool {
    self.rows == self.columns
  }
}

extension Matrix: Equatable where Element: Equatable {}

extension Matrix: Hashable where Element: Hashable {}

extension Matrix: Sendable where Element: Sendable {}
