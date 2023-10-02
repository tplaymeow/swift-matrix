import Matrix
import XCTest

final class MatrixInverseTests: XCTestCase {
  func testMatrixInverted1() throws {
    let matrix1 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [-2.0, 1.0],
      [1.5, -0.5],
    ])
    XCTAssertEqual(try matrix1.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted2() throws {
    let matrix2 = try Matrix(rows: [
      [2.0, 0.0],
      [0.0, 2.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [0.5, 0.0],
      [0.0, 0.5],
    ])
    XCTAssertEqual(try matrix2.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted3() throws {
    let matrix3 = try Matrix(rows: [
      [1.0]
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0]
    ])
    XCTAssertEqual(try matrix3.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted4() throws {
    let matrix4 = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    XCTAssertEqual(try matrix4.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted6() throws {
    let matrix6 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [0.0, 1.0, 4.0],
      [5.0, 6.0, 0.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [-24.0, 18.0, 5.0],
      [20.0, -15.0, -4.0],
      [-5.0, 4.0, 1.0],
    ])
    XCTAssertEqual(try matrix6.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted8() throws {
    let matrix8 = try Matrix(rows: [
      [2.0, 0.0, 0.0],
      [0.0, 2.0, 0.0],
      [0.0, 0.0, 2.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [0.5, 0.0, 0.0],
      [0.0, 0.5, 0.0],
      [0.0, 0.0, 0.5],
    ])
    XCTAssertEqual(try matrix8.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted9() throws {
    let matrix9 = try Matrix(rows: [
      [1.0, 2.0],
      [0.0, 1.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, -2.0],
      [0.0, 1.0],
    ])
    XCTAssertEqual(try matrix9.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted10() throws {
    let matrix10 = try Matrix(rows: [
      [1.0, 0.0],
      [2.0, 1.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [1.0, 0.0],
      [-2.0, 1.0],
    ])
    XCTAssertEqual(try matrix10.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted12() throws {
    let matrix12 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    let expectedMatrix = try Matrix(rows: [
      [-2.0, 1.0],
      [1.5, -0.5],
    ])
    XCTAssertEqual(try matrix12.inversed(), expectedMatrix, accuracy: 0.000001)
  }

  func testMatrixInverted14() throws {
    let matrix14 = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0],
      [0.0, 1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0, 7.0],
      [8.0, 9.0, 10.0, 11.0],
    ])
    XCTAssertThrowsError(try matrix14.inversed())
  }

  func testMatrixInverted15() throws {
    let matrix15 = try Matrix(rows: [
      [1.0, 2.0, 3.0, 4.0, 5.0],
      [0.0, 1.0, 2.0, 3.0, 4.0],
      [5.0, 6.0, 7.0, 8.0, 9.0],
      [10.0, 11.0, 12.0, 13.0, 14.0],
      [15.0, 16.0, 17.0, 18.0, 19.0],
    ])
    XCTAssertThrowsError(try matrix15.inversed())
  }
}
