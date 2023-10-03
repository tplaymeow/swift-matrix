extension Matrix {
  /// Provides subscripting access to a specific row of the matrix.
  ///
  /// - Parameter row: The index of the row to access.
  /// - Returns: A `RowSlice` representing the selected row of the matrix.
  ///
  /// This subscript allows you to access a specific row of the matrix as a `RowSlice`. The `RowSlice` provides a view into the original matrix data for the selected row, allowing you to work with that row directly without copying the data.
  ///
  /// - Note: The row index is zero-based.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 3, columns: 3, data: [1, 2, 3, 4, 5, 6, 7, 8, 9])
  ///   let row = matrixA[row: 1] // Access the second row of matrixA
  ///   // Resulting row: [4, 5, 6]
  ///   ```
  @inlinable
  public subscript(row row: Int) -> RowSlice {
    let start = row * self.columns
    let end = (row + 1) * self.columns
    return RowSlice(slice: self.data[start..<end])
  }
}

extension Matrix {
  /// A structure representing a view of a specific row of a matrix.
  public struct RowSlice {
    @usableFromInline
    internal let slice: ArraySlice<Element>

    @usableFromInline
    internal init(slice: ArraySlice<Element>) {
      self.slice = slice
    }
  }
}

extension Matrix.RowSlice: Sequence {
  public func makeIterator() -> ArraySlice<Element>.Iterator {
    self.slice.makeIterator()
  }
}

extension Matrix.RowSlice: Collection {
  @inlinable
  public var startIndex: Int {
    .zero
  }

  @inlinable
  public var endIndex: Int {
    self.slice.count
  }

  @inlinable
  public func index(after i: Int) -> Int {
    i + 1
  }

  @inlinable
  public subscript(position: Int) -> Element {
    _read {
      let start = self.slice.startIndex
      let index = self.index(start, offsetBy: position)
      yield self.slice[index]
    }
  }
}
