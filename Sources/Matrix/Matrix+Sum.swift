extension Matrix where Element: Numeric {
  /// Calculates the sum of elements along a specified axis of the matrix.
  ///
  /// - Parameters:
  ///   - axis: The axis along which the sum should be calculated. Default is `.column`.
  /// - Returns: A matrix representing the sum of elements along the specified axis.
  ///
  /// This method calculates the sum of elements along the specified `axis` of the matrix and returns a new matrix representing the result. You can choose to calculate the sum along rows or columns, and the result is a matrix with a single row or column, depending on the axis.
  ///
  /// - Note: The default axis is `.column`, which means that the sum is calculated along the columns of the matrix.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 3, columns: 3, data: [1, 2, 3, 4, 5, 6, 7, 8, 9])
  ///   let columnSumMatrix = matrixA.sum(axis: .column) // Sum along columns as a matrix
  ///   // Resulting columnSumMatrix: [[12, 15, 18]]
  ///
  ///   let rowSumMatrix = matrixA.sum(axis: .row) // Sum along rows as a matrix
  ///   // Resulting rowSumMatrix: [[6], [15], [24]]
  ///   ```
  @inlinable
  public func sum(axis: MatrixAxis = .column) -> Matrix<Element> {
    switch axis {
    case .row:
      return Matrix(column: self.sumAsArray(axis: .row))
    case .column:
      return Matrix(row: self.sumAsArray(axis: .column))
    }
  }

  @usableFromInline
  internal func sumAsArray(axis: MatrixAxis = .column) -> [Element] {
    switch axis {
    case .row:
      var result: [Element] = .init(repeating: .zero, count: self.columns)
      for column in 0..<self.columns {
        for row in 0..<self.rows {
          result[column] += self[row, column]
        }
      }
      return result

    case .column:
      var result: [Element] = .init(repeating: .zero, count: self.rows)
      for row in 0..<self.rows {
        for column in 0..<self.columns {
          result[row] += self[row, column]
        }
      }
      return result
    }
  }
}
