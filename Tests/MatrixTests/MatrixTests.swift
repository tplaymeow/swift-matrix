import XCTest
import Matrix

final class MatrixTests: XCTestCase {
  func testMatrixInit() throws {
    let matrix = Matrix(rows: 2, columns: 2, repeating: 0)
    XCTAssertEqual(matrix[0, 0], 0)
    XCTAssertEqual(matrix[0, 1], 0)
    XCTAssertEqual(matrix[1, 0], 0)
    XCTAssertEqual(matrix[1, 1], 0)
  }
}
