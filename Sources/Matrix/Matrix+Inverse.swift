import CLapack
import COpenBLAS

/// An enumeration representing errors that can occur when calculating the inverse matrix.
public enum MatrixInverseError: Error, Sendable {
  /// The matrix is not square, and its inverse cannot be calculated.
  case notSquare

  /// The matrix has a singular factor, and its inverse cannot be determined.
  /// - Parameters:
  ///   - index: The index of the singular factor, specifying the row and column.
  case singularFactor(index: Int)

  /// An unknown error occurred during inverse matrix calculation.
  case unknown
}

extension MatrixInverseError: CustomStringConvertible {
  @inlinable
  public var description: String {
    switch self {
    case .notSquare:
      return "Matrix must be square"
    case let .singularFactor(index):
      return "Factor is exactly singular. Element at (\(index), \(index)) is exactly zero"
    case .unknown:
      return "Unknown error"
    }
  }
}

extension Matrix where Element == Double {
  /// Calculates inverse matrix.
  ///
  /// - Returns: The inverse matrix.
  /// - Throws:
  ///   - `MatrixInverseError.notSquare` if the matrix is not square.
  ///   - `MatrixInverseError.singularFactor` if the matrix has a singular factor.
  ///   - `MatrixInverseError.unknown` if an unknown error occurs during calculation.
  @inlinable
  public func inversed() throws -> Self {
    guard self.isSquare else {
      throw MatrixInverseError.notSquare
    }

    @inline(__always)
    func check(result: Int32) throws {
      if result > 0 {
        throw MatrixInverseError.singularFactor(index: Int(result))
      } else if result < 0 {
        throw MatrixInverseError.unknown
      }
    }

    let size = self.rowsCount
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
    try check(result: dgetrfResult)

    let dgetriResult = LAPACKE_dgetri(
      LAPACK_ROW_MAJOR,
      size32,
      &resultData,
      size32,
      &ipiv32)
    try check(result: dgetriResult)

    return Matrix(size: .init(rows: size, columns: size), data: resultData)
  }
}
