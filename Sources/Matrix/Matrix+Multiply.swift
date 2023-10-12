import COpenBLAS
import LinearAlgebra

/// An enumeration representing errors that can occur during matrix multiplication.
public enum MatrixMultiplyError: Error, Sendable {
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

extension Matrix where Element: LinearAlgebraScalar {
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
    guard left.columnsCount == right.rowsCount else {
      throw MatrixMultiplyError.incorrectSize
    }

    let leftRowsCount = Int32(left.rowsCount)
    let rightColumnsCount = Int32(right.columnsCount)
    let leftColumnsRightRowsCount = Int32(left.columnsCount)

    var resultData: [Element] = .init(
      repeating: 0,
      count: left.rowsCount * right.columnsCount)

    Element.cblas_gemm(
      CblasRowMajor, CblasNoTrans, CblasNoTrans,
      leftRowsCount, rightColumnsCount, leftColumnsRightRowsCount,
      1,
      left.data, leftColumnsRightRowsCount,
      right.data, rightColumnsCount,
      0,
      &resultData, rightColumnsCount)

    return Matrix(
      size: .init(rows: left.rowsCount, columns: right.columnsCount),
      data: resultData)
  }
}
