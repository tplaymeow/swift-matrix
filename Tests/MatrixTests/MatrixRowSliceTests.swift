import Matrix
import XCTest

final class MatrixRowSliceTests: XCTestCase {
  func testRowSlice1() throws {
    let matrix = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0, 5.0],
      [0.0, 1.0, 2.0, 3.0, 4.0],
      [5.0, 6.0, 7.0, 8.0, 9.0],
      [10.0, 11.0, 12.0, 13.0, 14.0],
      [15.0, 16.0, 17.0, 18.0, 19.0],
    ])

    XCTAssertEqual(Array(matrix[row: 0]), [1.0, 2.0, 3.0, 4.0, 5.0])
    XCTAssertEqual(Array(matrix[row: 1]), [0.0, 1.0, 2.0, 3.0, 4.0])
    XCTAssertEqual(Array(matrix[row: 2]), [5.0, 6.0, 7.0, 8.0, 9.0])
    XCTAssertEqual(Array(matrix[row: 3]), [10.0, 11.0, 12.0, 13.0, 14.0])
    XCTAssertEqual(Array(matrix[row: 4]), [15.0, 16.0, 17.0, 18.0, 19.0])

    XCTAssertEqual(matrix[row: 0][0], 1.0)
    XCTAssertEqual(matrix[row: 1][1], 1.0)
    XCTAssertEqual(matrix[row: 2][2], 7.0)
    XCTAssertEqual(matrix[row: 3][3], 13.0)
    XCTAssertEqual(matrix[row: 4][4], 19.0)
  }

  func testRowSlice2() throws {
    let matrix = try Matrix(rows: [
      [12.0]
    ])

    XCTAssertEqual(Array(matrix[row: 0]), [12.0])

    XCTAssertEqual(matrix[row: 0][0], 12.0)
  }

  func testRowSlice3() throws {
    let matrix = try Matrix(rows: [
      [2.0, 4.0],
      [6.0, 8.0],
    ])

    XCTAssertEqual(Array(matrix[row: 0]), [2.0, 4.0])
    XCTAssertEqual(Array(matrix[row: 1]), [6.0, 8.0])

    XCTAssertEqual(matrix[row: 0][0], 2.0)
    XCTAssertEqual(matrix[row: 1][1], 8.0)
  }

  func testRowSlice4() throws {
    let matrix = try Matrix(rows: [
      [1.0, 1.0, 1.0],
      [2.0, 2.0, 2.0],
      [3.0, 3.0, 3.0],
    ])

    XCTAssertEqual(Array(matrix[row: 0]), [1.0, 1.0, 1.0])
    XCTAssertEqual(Array(matrix[row: 1]), [2.0, 2.0, 2.0])
    XCTAssertEqual(Array(matrix[row: 2]), [3.0, 3.0, 3.0])

    XCTAssertEqual(matrix[row: 0][2], 1.0)
    XCTAssertEqual(matrix[row: 1][0], 2.0)
    XCTAssertEqual(matrix[row: 2][1], 3.0)
  }
}
