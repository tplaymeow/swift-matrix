/// A struct representing the size (number of rows and columns) of a matrix.
@frozen
public struct MatrixSize: Equatable, Hashable, Sendable {
  /// The number of rows in the matrix.
  public let rows: Int

  /// The number of columns in the matrix.
  public let columns: Int

  /// Checks if the matrix is square (i.e., it has an equal number of rows and columns).
  ///
  /// - Returns: `true` if the matrix is square; otherwise, `false`.
  @inlinable
  public var isSquare: Bool {
    self.rows == self.columns
  }

  /// Initializes a `MatrixSize` struct with the specified number of rows and columns.
  ///
  /// - Parameters:
  ///   - rows: The number of rows in the matrix.
  ///   - columns: The number of columns in the matrix.
  @inlinable
  public init(rows: Int, columns: Int) {
    self.rows = rows
    self.columns = columns
  }
}
