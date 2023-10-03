import Matrix
import XCTest

final class MatrixSumMeanTests: XCTestCase {
  func testByRow() throws {
    let matrix = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 9.0],
    ])

    let rowSum = matrix.sum(axis: .row)
    let rowMean = matrix.mean(axis: .row)

    XCTAssertEqual(rowSum, Matrix(column: [12.0, 15.0, 18.0]))
    XCTAssertEqual(rowMean, Matrix(column: [4.0, 5.0, 6.0]))
  }

  func testByColumn() throws {
    let matrix = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 9.0],
    ])

    let columnSum = matrix.sum(axis: .column)
    let columnMean = matrix.mean(axis: .column)

    XCTAssertEqual(columnSum, Matrix(row: [6.0, 15.0, 24.0]))
    XCTAssertEqual(columnMean, Matrix(row: [2.0, 5.0, 8.0]))
  }

  func testByRowWithZeroMatrix() throws {
    let matrix = try Matrix(rows: [
      [0.0, 0.0],
      [0.0, 0.0],
    ])

    let rowSum = matrix.sum(axis: .row)
    let rowMean = matrix.mean(axis: .row)

    XCTAssertEqual(rowSum, Matrix(column: [0.0, 0.0]))
    XCTAssertEqual(rowMean, Matrix(column: [0.0, 0.0]))
  }

  func testByColumnWithZeroMatrix() throws {
    let matrix = try Matrix(rows: [
      [0.0, 0.0],
      [0.0, 0.0],
    ])

    let columnSum = matrix.sum(axis: .column)
    let columnMean = matrix.mean(axis: .column)

    XCTAssertEqual(columnSum, Matrix(row: [0.0, 0.0]))
    XCTAssertEqual(columnMean, Matrix(row: [0.0, 0.0]))
  }
}
