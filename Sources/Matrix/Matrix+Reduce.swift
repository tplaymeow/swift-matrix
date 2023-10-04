extension Matrix {
  /// Reduces the elements of the matrix using a specified accumulator.
  ///
  /// - Parameters:
  ///   - initialResult: The initial accumulator value.
  ///   - updateAccumulatingResult: A closure that updates the accumulator with each element.
  /// - Returns: The final accumulator value.
  ///
  /// This method reduces the elements of the matrix using the specified `initialResult` and `updateAccumulatingResult` closure. The closure is applied sequentially to each element, allowing you to accumulate values. The result is a single value of the same type as the accumulator.
  ///
  /// - Note: This method is suitable for reducing the entire matrix to a single value.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let sum = matrix.reduce(into: 0) { $0 += $1 }
  ///   // Resulting sum: 10
  ///   ```
  @inlinable
  public func reduce<Result>(
    into initialResult: Result,
    _ updateAccumulatingResult: (inout Result, Element) throws -> Void
  ) rethrows -> Result {
    try self.data.reduce(into: initialResult, updateAccumulatingResult)
  }

  /// Reduces the elements of the matrix using a specified closure.
  ///
  /// - Parameters:
  ///   - initialResult: The initial accumulator value.
  ///   - nextPartialResult: A closure that combines the accumulator and each element.
  /// - Returns: The final accumulator value.
  ///
  /// This method reduces the elements of the matrix using the specified `initialResult` and `nextPartialResult` closure. The closure is applied sequentially to each element, allowing you to accumulate values. The result is a single value of the same type as the accumulator.
  ///
  /// - Note: This method is suitable for reducing the entire matrix to a single value.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let product = matrix.reduce(1) { $0 * $1 }
  ///   // Resulting product: 24
  ///   ```
  @inlinable
  public func reduce<Result>(
    _ initialResult: Result,
    _ nextPartialResult: (Result, Element) throws -> Result
  ) rethrows -> Result {
    try self.data.reduce(initialResult, nextPartialResult)
  }

  /// Reduces the elements of the matrix along a specified axis using a specified accumulator.
  ///
  /// - Parameters:
  ///   - axis: The axis along which the reduction should be performed.
  ///   - initialResult: The initial accumulator value.
  ///   - updateAccumulatingResult: A closure that updates the accumulator with each element.
  /// - Returns: A matrix representing the final accumulator values along the specified axis.
  ///
  /// This method reduces the elements of the matrix along the specified `axis` using the specified `initialResult` and `updateAccumulatingResult` closure. The closure is applied sequentially to each element along the axis, allowing you to accumulate values. The result is a matrix with a single row or column, depending on the axis, containing the accumulator values.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let columnSumMatrix = matrix.reduce(axis: .column, into: 0) { $0 += $1 }
  ///   // Resulting columnSumMatrix: [[4], [6]]
  ///   ```
  @inlinable
  public func reduce<Result>(
    axis: MatrixAxis,
    into initialResult: Result,
    _ updateAccumulatingResult: (inout Result, Element) throws -> Void
  ) rethrows -> Matrix<Result> {
    switch axis {
    case .row:
      var result = Array(repeating: initialResult, count: self.columns)
      for column in 0..<self.columns {
        for row in 0..<self.rows {
          try updateAccumulatingResult(&result[column], self[row, column])
        }
      }
      return Matrix<Result>(column: result)

    case .column:
      var result = Array(repeating: initialResult, count: self.columns)
      for row in 0..<self.rows {
        for column in 0..<self.columns {
          try updateAccumulatingResult(&result[row], self[row, column])
        }
      }
      return Matrix<Result>(row: result)
    }
  }

  /// Reduces the elements of the matrix along a specified axis using a specified closure.
  ///
  /// - Parameters:
  ///   - axis: The axis along which the reduction should be performed.
  ///   - initialResult: The initial accumulator value.
  ///   - nextPartialResult: A closure that combines the accumulator and each element along the axis.
  /// - Returns: A matrix representing the final accumulator values along the specified axis.
  ///
  /// This method reduces the elements of the matrix along the specified `axis` using the specified `initialResult` and `nextPartialResult` closure. The closure is applied sequentially to each element along the axis, allowing you to accumulate values. The result is a matrix with a single row or column, depending on the axis, containing the accumulator values.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrix = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let rowProductMatrix = matrix.reduce(axis: .row, 1) { $0 * $1 }
  ///   // Resulting rowProductMatrix: [[2], [12]]
  ///   ```
  @inlinable
  public func reduce<Result>(
    axis: MatrixAxis,
    _ initialResult: Result,
    _ nextPartialResult: (Result, Element) throws -> Result
  ) rethrows -> Matrix<Result> {
    try self.reduce(axis: axis, into: initialResult) {
      $0 = try nextPartialResult($0, $1)
    }
  }
}
