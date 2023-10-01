extension Matrix {
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
