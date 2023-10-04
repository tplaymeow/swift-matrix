public struct Matrix<Element> {
  /// Size of the matrix
  public let size: MatrixSize

  @usableFromInline
  internal var data: [Element]

  @usableFromInline
  internal init(size: MatrixSize, data: [Element]) {
    self.size = size
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
    self.size = .init(rows: rows, columns: columns)
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

    self.size = .init(rows: rows, columns: columns)
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

    self.size = .init(rows: rows, columns: columns)
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

    self.size = .init(rows: rows.count, columns: firstRowCount)
    self.data = data
  }
}

extension Matrix {
  /// Initializes a matrix with a single row from an array of elements.
  ///
  /// - Parameter row: An array of elements representing a single row of the matrix.
  ///
  /// Use this initializer to create a matrix with a single row from the provided array of elements. The number of columns in the matrix is determined by the number of elements in the input array.
  ///
  /// - Example:
  ///   ```swift
  ///   let rowArray = [1.0, 2.0, 3.0]
  ///   let matrix = Matrix(row: rowArray)
  ///   // Represents a 1x3 matrix: [[1.0, 2.0, 3.0]]
  ///   ```
  @inlinable
  public init(row: [Element]) {
    self.init(size: .init(rows: 1, columns: row.count), data: row)
  }

  /// Initializes a matrix with a single column from an array of elements.
  ///
  /// - Parameter column: An array of elements representing a single column of the matrix.
  ///
  /// Use this initializer to create a matrix with a single column from the provided array of elements. The number of rows in the matrix is determined by the number of elements in the input array.
  ///
  /// - Example:
  ///   ```swift
  ///   let columnArray = [1.0, 2.0, 3.0]
  ///   let matrix = Matrix(column: columnArray)
  ///   // Represents a 3x1 matrix: [[1.0], [2.0], [3.0]]
  ///   ```
  @inlinable
  public init(column: [Element]) {
    self.init(size: .init(rows: column.count, columns: 1), data: column)
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
      yield self.data[row * self.size.columns + column]
    }
    _modify {
      yield &self.data[row * self.size.columns + column]
    }
  }
}

extension Matrix {
  /// The number of rows in the matrix.
  @inlinable
  @inline(__always)
  public var rowsCount: Int {
    self.size.rows
  }

  /// The number of columns in the matrix.
  @inlinable
  @inline(__always)
  public var columnsCount: Int {
    self.size.columns
  }
}

extension Matrix {
  /// Checks if the matrix is square (i.e., it has an equal number of rows and columns).
  ///
  /// - Returns: `true` if the matrix is square; otherwise, `false`.
  @inlinable
  public var isSquare: Bool {
    self.size.isSquare
  }
}

extension Matrix {
  /// Returns a flattened array containing all the elements of the matrix.
  ///
  /// Use this property to obtain a one-dimensional array that contains all the elements of the matrix.
  /// The elements are arranged in row-major order, starting from the top-left corner of the matrix and proceeding row by row.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 3, data: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
  ///   let flattenedArray = matrix.flattenArray
  ///   // Resulting flattenedArray: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0]
  ///   ```
  @inlinable
  public var flattenArray: [Element] {
    self.data
  }

  /// Returns a two-dimensional array containing the elements of the matrix.
  ///
  /// Use this property to obtain a two-dimensional array that represents the matrix.
  /// The elements are organized in rows and columns, preserving the original matrix structure.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 3, data: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
  ///   let arrayRepresentation = matrix.array
  ///   // Resulting arrayRepresentation:
  ///   // [[1.0, 2.0, 3.0],
  ///   //  [4.0, 5.0, 6.0]]
  ///   ```
  @inlinable
  public var array: [[Element]] {
    stride(
      from: self.data.startIndex,
      to: self.data.endIndex,
      by: self.columnsCount
    ).map {
      Array(self.data[$0..<$0 + self.columnsCount])
    }
  }
}

extension Matrix: Equatable where Element: Equatable {}

extension Matrix: Hashable where Element: Hashable {}

extension Matrix: Sendable where Element: Sendable {}
