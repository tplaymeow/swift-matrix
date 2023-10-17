import Matrix
import XCTest

final class MatrixAdditionTests: XCTestCase {
  func testMatrixAddition() throws {
    let matrix1 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])

    let matrix2 = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])

    let result = try matrix1 + matrix2

    XCTAssertEqual(
      result,
      try Matrix(rows: [
        [6.0, 8.0],
        [10.0, 12.0],
      ]))
  }

  func testMatrixInPlaceAddition() throws {
    var matrix1 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])

    let matrix2 = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])

    try matrix1 += matrix2

    XCTAssertEqual(
      matrix1,
      try Matrix(rows: [
        [6.0, 8.0],
        [10.0, 12.0],
      ]))
  }

  func testMatrixSubtraction() throws {
    let matrix1 = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])

    let matrix2 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])

    let result = try matrix1 - matrix2

    XCTAssertEqual(
      result,
      try Matrix(rows: [
        [4.0, 4.0],
        [4.0, 4.0],
      ]))
  }

  func testMatrixInPlaceSubtraction() throws {
    var matrix1 = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])

    let matrix2 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])

    try matrix1 -= matrix2

    XCTAssertEqual(
      matrix1,
      try Matrix(rows: [
        [4.0, 4.0],
        [4.0, 4.0],
      ]))
  }

  func testMatrixSizeMismatch() throws {
    let matrix1 = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])

    let matrix2 = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
    ])

    XCTAssertThrowsError(try matrix1 + matrix2) { error in
      XCTAssertEqual(error as? MatrixAdditionError, .incorrectSize)
    }
  }
}
