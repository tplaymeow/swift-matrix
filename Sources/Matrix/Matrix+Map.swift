extension Matrix {
  /// Transforms each element of the matrix using the provided closure and creates a new matrix with the transformed elements.
  ///
  /// - Parameters:
  ///   - transform: A closure that takes an element from the current matrix and returns a new element of a different type.
  /// - Returns: A new matrix with elements transformed by the closure.
  /// - Throws: Any errors thrown by the transformation closure.
  @inlinable
  public func map<NewElement>(
    _ transform: (Element) throws -> NewElement
  ) rethrows -> Matrix<NewElement> {
    .init(
      rows: self.rows,
      columns: self.columns,
      data: try self.data.map(transform))
  }
}
