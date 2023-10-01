import CLapack
import COpenBLAS

public enum MatrixInverseError: Error {
  case notSquare
  case singularFactor(index: Int)
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
    try check(result: dgetrfResult)

    let dgetriResult = LAPACKE_dgetri(
      LAPACK_ROW_MAJOR,
      size32,
      &resultData,
      size32,
      &ipiv32)
    try check(result: dgetriResult)

    return Matrix(rows: size, columns: size, data: resultData)
  }
}
