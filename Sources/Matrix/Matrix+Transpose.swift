import COpenBLAS

extension Matrix where Element == Double {
  @inlinable
  public func transposed(multiplyBy multiplier: Double = 1.0) throws -> Self {
    let rowsCount = Int32(self.rows)
    let columnsCount = Int32(self.columns)
    var data = self.data
    var resultData = self.data
    cblas_domatcopy(
      CblasRowMajor, CblasTrans,
      rowsCount, columnsCount,
      multiplier,
      &data, columnsCount,
      &resultData, rowsCount)
    return Matrix(rows: self.columns, columns: self.rows, data: resultData)
  }
}
