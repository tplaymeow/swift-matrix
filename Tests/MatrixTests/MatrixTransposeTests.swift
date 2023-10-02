import Matrix
import XCTest

final class MatrixTransposeTests: XCTestCase {
  func testMatrixTransposed1() throws {
    let matrix1 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [1.0, 2.0, 3.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 1.0],
      [2.0, 2.0],
      [3.0, 3.0],
    ])
    XCTAssertEqual(matrix1.transposed(), expectedMatrix)
  }

  func testMatrixTransposed2() throws {
    let matrix2 = try Matrix(rows: [
      [1.0, 1.0],
      [2.0, 2.0],
      [3.0, 3.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [1.0, 2.0, 3.0],
    ])
    XCTAssertEqual(matrix2.transposed(), expectedMatrix)
  }

  func testMatrixTransposed3() throws {
    let matrix3 = try Matrix(rows: [
      [4.0, 5.0],
      [6.0, 7.0],
      [8.0, 9.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [4.0, 6.0, 8.0],
      [5.0, 7.0, 9.0],
    ])
    XCTAssertEqual(matrix3.transposed(), expectedMatrix)
  }

  func testMatrixTransposed4() throws {
    let matrix4 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 3.0],
      [2.0, 4.0],
    ])
    XCTAssertEqual(matrix4.transposed(), expectedMatrix)
  }

  func testMatrixTransposed5() throws {
    let matrix5 = try Matrix(rows: [
      [1.0, 2.0, 3.0]
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
    ])
    XCTAssertEqual(matrix5.transposed(), expectedMatrix)
  }

  func testMatrixTransposed6() throws {
    let matrix6 = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 2.0, 3.0]
    ])
    XCTAssertEqual(matrix6.transposed(), expectedMatrix)
  }

  func testMatrixTransposed7() throws {
    let matrix7 = try Matrix(rows: [
      [1.0]
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0]
    ])
    XCTAssertEqual(matrix7.transposed(), expectedMatrix)
  }

  func testMatrixTransposed8() throws {
    let matrix8 = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    XCTAssertEqual(matrix8.transposed(), expectedMatrix)
  }

  func testMatrixTransposed9() throws {
    let matrix9 = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
      [4.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0]
    ])
    XCTAssertEqual(matrix9.transposed(), expectedMatrix)
  }

  func testMatrixTransposed10() throws {
    let matrix10 = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0]
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
      [4.0],
    ])
    XCTAssertEqual(matrix10.transposed(), expectedMatrix)
  }
}
