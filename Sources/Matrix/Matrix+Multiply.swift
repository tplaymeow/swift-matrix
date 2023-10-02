import COpenBLAS

/// An enumeration representing errors that can occur during matrix multiplication.
public enum MatrixMultiplyError: Error {
  /// The number of columns in the first matrix must be equal to the number of rows in the second matrix for multiplication.
  case incorrectSize
}

extension MatrixMultiplyError: CustomStringConvertible {
  public var description: String {
    switch self {
    case .incorrectSize:
      return
        "The number of columns in the first matrix must be equal to the number of rows in the second matrix"
    }
  }
}

extension Matrix where Element == Double {
  /// Multiplies two matrices of the same data type.
  ///
  /// - Parameters:
  ///   - left: The first matrix to multiply.
  ///   - right: The second matrix to multiply.
  /// - Returns: A new matrix resulting from the multiplication.
  /// - Throws:
  ///   - `MatrixMultiplyError.incorrectSize` if the number of columns in the first matrix is not equal to the number of rows in the second matrix.
  @inlinable
  public static func * (_ left: Self, _ right: Self) throws -> Self {
    guard left.columns == right.rows else {
      throw MatrixMultiplyError.incorrectSize
    }

    let leftRowsCount = Int32(left.rows)
    let rightColumnsCount = Int32(right.columns)
    let leftColumnsRightRowsCount = Int32(left.columns)

    var leftData = left.data
    var rightData = right.data
    var resultData = Array(repeating: 0.0, count: left.rows * right.columns)

    cblas_dgemm(
      CblasRowMajor, CblasNoTrans, CblasNoTrans,
      leftRowsCount, rightColumnsCount, leftColumnsRightRowsCount,
      1.0,
      &leftData, leftColumnsRightRowsCount,
      &rightData, rightColumnsCount,
      0.0,
      &resultData, rightColumnsCount)

    return Matrix(rows: left.rows, columns: right.columns, data: resultData)
  }
}
