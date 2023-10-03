extension Matrix {
  /// Provides subscripting access to a specific column of the matrix.
  ///
  /// - Parameter column: The index of the column to access.
  /// - Returns: A `ColumnSlice` representing the selected column of the matrix.
  ///
  /// This subscript allows you to access a specific column of the matrix as a `ColumnSlice`. The `ColumnSlice` provides a view into the original matrix data for the selected column, allowing you to work with that column directly without copying the data.
  ///
  /// - Note: The column index is zero-based.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 3, columns: 3, data: [1, 2, 3, 4, 5, 6, 7, 8, 9])
  ///   let column = matrixA[column: 1] // Access the second column of matrixA
  ///   // Resulting column: [2, 5, 8]
  ///   ```
  @inlinable
  public subscript(column column: Int) -> ColumnSlice {
    ColumnSlice(column: column, rows: self.rows, columns: self.columns, data: self.data)
  }
}

extension Matrix {
  /// A structure representing a view of a specific column of a matrix.
  public struct ColumnSlice {
    @usableFromInline
    internal let column: Int

    @usableFromInline
    internal let rows: Int

    @usableFromInline
    internal let columns: Int

    @usableFromInline
    internal let data: [Element]

    @usableFromInline
    internal init(column: Int, rows: Int, columns: Int, data: [Element]) {
      self.column = column
      self.rows = rows
      self.columns = columns
      self.data = data
    }
  }
}

extension Matrix.ColumnSlice: Sequence {
  public struct Iterator: IteratorProtocol {
    @usableFromInline
    internal var row: Int = 0

    @usableFromInline
    internal let column: Int

    @usableFromInline
    internal let rows: Int

    @usableFromInline
    internal let columns: Int

    @usableFromInline
    internal let data: [Element]

    @usableFromInline
    internal init(column: Int, rows: Int, columns: Int, data: [Element]) {
      self.column = column
      self.rows = rows
      self.columns = columns
      self.data = data
    }

    @inlinable
    public mutating func next() -> Element? {
      guard self.row < self.rows else { return nil }
      defer { self.row += 1 }
      return self.data[self.row * self.columns + self.column]
    }
  }

  @inlinable
  public func makeIterator() -> Iterator {
    Iterator(column: self.column, rows: self.rows, columns: self.columns, data: self.data)
  }
}

extension Matrix.ColumnSlice: Collection {
  @inlinable
  public var startIndex: Int {
    .zero
  }

  @inlinable
  public var endIndex: Int {
    self.columns
  }

  @inlinable
  public func index(after i: Int) -> Int {
    i + 1
  }

  @inlinable
  public subscript(position: Int) -> Element {
    _read {
      yield self.data[position * self.columns + self.column]
    }
  }
}
