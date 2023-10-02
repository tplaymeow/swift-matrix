import COpenBLAS

public enum MatrixMultiplyError: Error {
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
