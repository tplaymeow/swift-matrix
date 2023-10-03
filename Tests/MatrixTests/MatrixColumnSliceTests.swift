import Matrix
import XCTest

final class MatrixColumnSliceTests: XCTestCase {
  func testColumnSlice1() throws {
    let matrix = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0, 5.0],
      [0.0, 1.0, 2.0, 3.0, 4.0],
      [5.0, 6.0, 7.0, 8.0, 9.0],
      [10.0, 11.0, 12.0, 13.0, 14.0],
      [15.0, 16.0, 17.0, 18.0, 19.0],
    ])

    XCTAssertEqual(Array(matrix[column: 0]), [1.0, 0.0, 5.0, 10.0, 15.0])
    XCTAssertEqual(Array(matrix[column: 1]), [2.0, 1.0, 6.0, 11.0, 16.0])
    XCTAssertEqual(Array(matrix[column: 2]), [3.0, 2.0, 7.0, 12.0, 17.0])
    XCTAssertEqual(Array(matrix[column: 3]), [4.0, 3.0, 8.0, 13.0, 18.0])
    XCTAssertEqual(Array(matrix[column: 4]), [5.0, 4.0, 9.0, 14.0, 19.0])

    XCTAssertEqual(matrix[column: 0][0], 1.0)
    XCTAssertEqual(matrix[column: 1][1], 1.0)
    XCTAssertEqual(matrix[column: 2][2], 7.0)
    XCTAssertEqual(matrix[column: 3][3], 13.0)
    XCTAssertEqual(matrix[column: 4][4], 19.0)
  }

  func testColumnSlice2() throws {
    let matrix = try Matrix(rows: [
      [12.0]
    ])

    XCTAssertEqual(Array(matrix[column: 0]), [12.0])

    XCTAssertEqual(matrix[column: 0][0], 12.0)
  }

  func testColumnSlice3() throws {
    let matrix = try Matrix(rows: [
      [2.0, 4.0],
      [6.0, 8.0],
    ])

    XCTAssertEqual(Array(matrix[column: 0]), [2.0, 6.0])
    XCTAssertEqual(Array(matrix[column: 1]), [4.0, 8.0])

    XCTAssertEqual(matrix[column: 0][0], 2.0)
    XCTAssertEqual(matrix[column: 1][1], 8.0)
  }

  func testColumnSlice4() throws {
    let matrix = try Matrix(rows: [
      [1.0, 1.0, 1.0],
      [2.0, 2.0, 2.0],
      [3.0, 3.0, 3.0],
    ])

    XCTAssertEqual(Array(matrix[column: 0]), [1.0, 2.0, 3.0])
    XCTAssertEqual(Array(matrix[column: 1]), [1.0, 2.0, 3.0])
    XCTAssertEqual(Array(matrix[column: 2]), [1.0, 2.0, 3.0])

    XCTAssertEqual(matrix[column: 0][2], 3.0)
    XCTAssertEqual(matrix[column: 1][0], 1.0)
    XCTAssertEqual(matrix[column: 2][1], 2.0)
  }
}
