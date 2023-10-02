import CLapack

/// An enumeration representing errors that can occur when calculating the determinant of a matrix.
public enum MatrixDeterminantError: Error {
  /// The matrix is not square, and its determinant cannot be calculated.
  case notSquare

  /// An unknown error occurred during determinant calculation.
  case unknown
}

extension MatrixDeterminantError: CustomStringConvertible {
  @inlinable
  public var description: String {
    switch self {
    case .notSquare:
      return "Matrix must be square"
    case .unknown:
      return "Unknown error"
    }
  }
}

extension Matrix where Element == Double {
  /// Calculates the determinant of a square matrix.
  ///
  /// - Returns: The determinant of the matrix.
  /// - Throws:
  ///   - `MatrixDeterminantError.notSquare` if the matrix is not square.
  ///   - `MatrixDeterminantError.unknown` if an unknown error occurs during calculation.
  @inlinable
  public func determinant() throws -> Double {
    guard self.isSquare else {
      throw MatrixDeterminantError.notSquare
    }

    let size = self.rows
    let size32 = Int32(size)
    var ipiv32 = [Int32](repeating: 0, count: size)
    var resultData = self.data

    let dgetrfResult = LAPACKE_dgetrf(
      LAPACK_ROW_MAJOR,
      size32,
      size32,
      &resultData,
      size32,
      &ipiv32)

    guard dgetrfResult >= 0 else {
      throw MatrixDeterminantError.unknown
    }

    guard dgetrfResult == 0 else {
      return 0.0
    }

    var result = 1.0
    for index in 0..<size {
      result *= resultData[index * self.columns + index]
      if ipiv32[index] != index + 1 {
        result = -result
      }
    }

    return result
  }
}
