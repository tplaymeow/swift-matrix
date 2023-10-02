import Matrix
import XCTest

final class MatrixDeterminantTests: XCTestCase {
  func testMatrixDeterminant1() throws {
    let matrix1 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [0.0, 4.0, 4.0],
      [5.0, 6.0, 0.0],
    ])
    XCTAssertEqual(try matrix1.determinant(), -44.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant2() throws {
    let matrix2 = try Matrix(rows: [
      [2.0, 0.0],
      [0.0, 3.0],
    ])
    XCTAssertEqual(try matrix2.determinant(), 6.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant3() throws {
    let matrix3 = try Matrix(rows: [
      [1.0]
    ])
    XCTAssertEqual(try matrix3.determinant(), 1.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant4() throws {
    let matrix4 = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    XCTAssertEqual(try matrix4.determinant(), 1.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant5() throws {
    let matrix5 = try Matrix(rows: [
      [1.0],
      [2.0],
    ])
    XCTAssertThrowsError(try matrix5.determinant())
  }

  func testMatrixDeterminant6() throws {
    let matrix6 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 9.0],
    ])
    XCTAssertEqual(try matrix6.determinant(), 0.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant7() throws {
    let matrix7 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    XCTAssertEqual(try matrix7.determinant(), -2.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant8() throws {
    let matrix8 = try Matrix(rows: [
      [2.0, 0.0, 0.0],
      [0.0, 3.0, 0.0],
      [0.0, 0.0, 4.0],
    ])
    XCTAssertEqual(try matrix8.determinant(), 24.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant9() throws {
    let matrix9 = try Matrix(rows: [
      [1.0, 2.0],
      [0.0, 3.0],
    ])
    XCTAssertEqual(try matrix9.determinant(), 3.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant10() throws {
    let matrix10 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 10.0],
    ])
    XCTAssertEqual(try matrix10.determinant(), -3.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant11() throws {
    let matrix11 = try Matrix(rows: [
      [1.0, 0.0],
      [2.0, 3.0],
    ])
    XCTAssertEqual(try matrix11.determinant(), 3.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant12() throws {
    let matrix12 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    XCTAssertEqual(try matrix12.determinant(), -2.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant13() throws {
    let matrix13 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
      [7.0, 8.0, 9.0],
    ])
    XCTAssertEqual(try matrix13.determinant(), 0.0, accuracy: 0.000001)
  }

  func testMatrixDeterminant15() throws {
    let matrix15 = try Matrix(rows: [
      [2.0, 3.0],
      [1.0, 2.0],
    ])
    XCTAssertEqual(try matrix15.determinant(), 1.0, accuracy: 0.000001)
  }
}
