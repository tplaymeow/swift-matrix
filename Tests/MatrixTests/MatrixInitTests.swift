import Matrix
import XCTest

final class MatrixInitTests: XCTestCase {
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
}
