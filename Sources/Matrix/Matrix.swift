public struct Matrix<Element> {
  /// The number of rows in the matrix.
  public let rows: Int

  /// The number of columns in the matrix.
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
  /// Initializes a new matrix with the specified number of rows and columns, filling it with a repeating element.
  ///
  /// - Parameters:
  ///   - rows: The number of rows in the matrix.
  ///   - columns: The number of columns in the matrix.
  ///   - element: The element to repeat in the matrix.
  @inlinable
  public init(rows: Int, columns: Int, repeating element: Element) {
    self.rows = rows
    self.columns = columns
    self.data = .init(repeating: element, count: rows * columns)
  }
}

extension Matrix {
  /// Initializes a new matrix with the specified number of rows and columns, and an array of elements.
  ///
  /// - Parameters:
  ///   - rows: The number of rows in the matrix.
  ///   - columns: The number of columns in the matrix.
  ///   - elements: An array of elements representing the matrix.
  /// - Throws: `MatrixError` if the count of elements is not equal to `rows * columns`.
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
  /// Initializes a new matrix with the specified number of rows and columns, and a collection of elements.
  ///
  /// - Parameters:
  ///   - rows: The number of rows in the matrix.
  ///   - columns: The number of columns in the matrix.
  ///   - elements: A collection of elements representing the matrix.
  /// - Throws: `MatrixError` if the count of elements is not equal to `rows * columns`.
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
  /// Initializes a new matrix from a two-dimensional array of elements, where each sub-array represents a row.
  ///
  /// - Parameters:
  ///   - rows: A two-dimensional array of elements representing the matrix.
  /// - Throws: `MatrixError` if the rows are empty or if the rows have different column counts.
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
  public init(row: [Element]) {
    self.init(rows: 1, columns: row.count, data: row)
  }

  public init(column: [Element]) {
    self.init(rows: column.count, columns: 1, data: column)
  }
}

extension Matrix where Element: Numeric {
  /// Initializes a new square matrix with elements on the main diagonal and zeros elsewhere.
  ///
  /// - Parameters:
  ///   - diagonal: An array of elements for the main diagonal of the matrix.
  @inlinable
  public init(diogonal: [Element]) {
    self.init(rows: diogonal.count, columns: diogonal.count, repeating: .zero)
    for (index, element) in diogonal.enumerated() {
      self[index, index] = element
    }
  }

  /// Initializes a new square matrix with a repeating element on the main diagonal and zeros elsewhere.
  ///
  /// - Parameters:
  ///   - diagonalElement: The element to repeat on the main diagonal.
  ///   - count: The number of rows and columns in the square matrix.
  @inlinable
  public init(diogonalRepeating diogonalElement: Element, count: Int) {
    self.init(diogonal: .init(repeating: diogonalElement, count: count))
  }
}

extension Matrix {
  /// Accesses the element at the specified row and column in the matrix.
  ///
  /// - Parameters:
  ///   - row: The row index.
  ///   - column: The column index.
  /// - Returns: The element at the specified row and column.
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
  /// Checks if the matrix is square (i.e., it has an equal number of rows and columns).
  ///
  /// - Returns: `true` if the matrix is square; otherwise, `false`.
  @inlinable
  public var isSquare: Bool {
    self.rows == self.columns
  }
}

extension Matrix: Equatable where Element: Equatable {}

extension Matrix: Hashable where Element: Hashable {}

extension Matrix: Sendable where Element: Sendable {}
