import COpenBLAS

extension Matrix where Element == Double {
  /// Transposes the current matrix and optionally multiplies it by a scalar.
  ///
  /// - Parameters:
  ///   - multiplier: An optional scalar value to multiply the elements of the transposed matrix. Default is 1.0.
  /// - Returns: A new matrix representing the transpose of the current matrix (optionally multiplied by the scalar).
  ///
  /// Transposing a matrix means switching its rows and columns. If `multiplier` is specified, each element in the transposed matrix is multiplied by that scalar.
  ///
  /// - Note: The original matrix is not modified; a new matrix with the transposed data is created and returned.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 2, columns: 3, data: [1.0, 2.0, 3.0, 4.0, 5.0, 6.0])
  ///   let transposedMatrix = matrixA.transposed() // Transpose matrixA
  ///   // Resulting transposedMatrix: [[1.0, 4.0], [2.0, 5.0], [3.0, 6.0]]
  ///
  ///   let scaledTransposedMatrix = matrixA.transposed(multiplyBy: 2.0) // Transpose matrixA and multiply by 2.0
  ///   // Resulting scaledTransposedMatrix: [[2.0, 8.0], [4.0, 10.0], [6.0, 12.0]]
  ///   ```
  @inlinable
  public func transposed(multiplyBy multiplier: Double = 1.0) -> Self {
    let rowsCount = Int32(self.rowsCount)
    let columnsCount = Int32(self.columnsCount)
    var data = self.data
    var resultData = self.data
    cblas_domatcopy(
      CblasRowMajor, CblasTrans,
      rowsCount, columnsCount,
      multiplier,
      &data, columnsCount,
      &resultData, rowsCount)
    return Matrix(
      size: .init(rows: self.columnsCount, columns: self.rowsCount),
      data: resultData)
  }
}
