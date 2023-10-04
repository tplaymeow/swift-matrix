extension Matrix where Element: FloatingPoint {
  /// Calculates the mean (average) of elements along a specified axis of the matrix.
  ///
  /// - Parameters:
  ///   - axis: The axis along which the mean should be calculated. Default is `.column`.
  /// - Returns: A matrix representing the mean of elements along the specified axis.
  ///
  /// This method calculates the mean (average) of elements along the specified `axis` of the matrix and returns a new matrix representing the result. You can choose to calculate the mean along rows or columns, and the result is a matrix with a single row or column, depending on the axis.
  ///
  /// - Note: The default axis is `.column`, which means that the mean is calculated along the columns of the matrix.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 3, columns: 3, data: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 8.0, 9.0])
  ///   let columnMeanMatrix = matrixA.mean(axis: .column) // Mean along columns as a matrix
  ///   // Resulting columnMeanMatrix: [[4.0, 5.0, 6.0]]
  ///
  ///   let rowMeanMatrix = matrixA.mean(axis: .row) // Mean along rows as a matrix
  ///   // Resulting rowMeanMatrix: [[2.0], [5.0], [8.0]]
  ///   ```
  @inlinable
  public func mean(axis: MatrixAxis = .column) -> Matrix<Element> {
    switch axis {
    case .row:
      let rows = Element(self.rowsCount)
      return self.sum(axis: .row).map { $0 / rows }

    case .column:
      let columns = Element(self.columnsCount)
      return self.sum(axis: .column).map { $0 / columns }
    }
  }
}
