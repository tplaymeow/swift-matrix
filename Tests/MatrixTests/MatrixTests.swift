import Matrix
import XCTest

final class MatrixTests: XCTestCase {
  func testMatrixInitRepeating() throws {
    let matrix = Matrix(rows: 2, columns: 2, repeating: 0)
    XCTAssertEqual(matrix[0, 0], 0)
    XCTAssertEqual(matrix[0, 1], 0)
    XCTAssertEqual(matrix[1, 0], 0)
    XCTAssertEqual(matrix[1, 1], 0)
  }

  func testMatrixInitElements() throws {
    let matrix = try Matrix(rows: 2, columns: 2, elements: [1, 2, 3, 4])
    XCTAssertEqual(matrix[0, 0], 1)
    XCTAssertEqual(matrix[0, 1], 2)
    XCTAssertEqual(matrix[1, 0], 3)
    XCTAssertEqual(matrix[1, 1], 4)
  }

  func testMatrixInitRows() throws {
    let matrix = try Matrix(rows: [
      [1, 2, 3],
      [4, 5, 6],
    ])
    XCTAssertEqual(matrix[0, 0], 1)
    XCTAssertEqual(matrix[0, 1], 2)
    XCTAssertEqual(matrix[0, 2], 3)
    XCTAssertEqual(matrix[1, 0], 4)
    XCTAssertEqual(matrix[1, 1], 5)
    XCTAssertEqual(matrix[1, 2], 6)
  }

  func testMatrixIverted() throws {
    let matrix = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ]).inversed()
    XCTAssertEqual(matrix[0, 0], -2, accuracy: 0.000001)
    XCTAssertEqual(matrix[0, 1], 1, accuracy: 0.000001)
    XCTAssertEqual(matrix[1, 0], 3 / 2, accuracy: 0.000001)
    XCTAssertEqual(matrix[1, 1], -1 / 2, accuracy: 0.000001)
  }

  func testMatrixTransposed() throws {
    XCTAssertEqual(
      try Matrix(rows: [
        [1.0, 2.0, 3.0],
        [1.0, 2.0, 3.0],
      ]).transposed(),
      try Matrix(rows: [
        [1.0, 1.0],
        [2.0, 2.0],
        [3.0, 3.0],
      ])
    )
    XCTAssertEqual(
      try Matrix(rows: [
        [1.0, 1.0],
        [2.0, 2.0],
        [3.0, 3.0],
      ]).transposed(),
      try Matrix(rows: [
        [1.0, 2.0, 3.0],
        [1.0, 2.0, 3.0],
      ])
    )
  }

  func testMatrixMultiply() throws {
    let a = try Matrix(rows: [
      [1.0, 1.0],
      [2.0, 2.0],
      [3.0, 3.0],
    ])
    let b = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [1.0, 2.0, 3.0],
    ])
    let res = try Matrix(rows: [
      [2.0, 4.0, 6.0],
      [4.0, 8.0, 12.0],
      [6.0, 12.0, 18.0],
    ])
    XCTAssertEqual(try a * b, res)
  }
}
