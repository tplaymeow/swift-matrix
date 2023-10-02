import Matrix
import XCTest

final class MatrixMultiplicationTests: XCTestCase {
  func testMatrixMultiply1() throws {
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

  func testMatrixMultiply2() throws {
    let a = try Matrix(rows: [
      [2.0, 4.0],
      [1.0, 3.0],
    ])
    let b = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])
    let res = try Matrix(rows: [
      [38.0, 44.0],
      [26.0, 30.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply3() throws {
    let a = try Matrix(rows: [
      [1.0]
    ])
    let b = try Matrix(rows: [
      [2.0]
    ])
    let res = try Matrix(rows: [
      [2.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply4() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0]
    ])
    let b = try Matrix(rows: [
      [3.0],
      [4.0],
    ])
    let res = try Matrix(rows: [
      [11.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply5() throws {
    let a = try Matrix(rows: [
      [1.0],
      [2.0],
    ])
    let b = try Matrix(rows: [
      [2.0, 3.0]
    ])
    let res = try Matrix(rows: [
      [2.0, 3.0],
      [4.0, 6.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply6() throws {
    let a = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    let b = try Matrix(rows: [
      [2.0, 3.0],
      [4.0, 5.0],
    ])
    let res = try Matrix(rows: [
      [2.0, 3.0],
      [4.0, 5.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply7() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [4.0, 5.0, 6.0],
    ])
    let b = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
    ])
    let res = try Matrix(rows: [
      [14.0],
      [32.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply8() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
    ])
    let b = try Matrix(rows: [
      [5.0, 6.0],
      [7.0, 8.0],
    ])
    let res = try Matrix(rows: [
      [19.0, 22.0],
      [43.0, 50.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply9() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
      [5.0, 6.0],
    ])
    let b = try Matrix(rows: [
      [1.0, 0.0],
      [0.0, 1.0],
    ])
    let res = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
      [5.0, 6.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply10() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0]
    ])
    let b = try Matrix(rows: [
      [3.0, 4.0],
      [5.0, 6.0],
    ])
    let res = try Matrix(rows: [
      [13.0, 16.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply11() throws {
    let a = try Matrix(rows: [
      [1.0],
      [2.0],
      [3.0],
    ])
    let b = try Matrix(rows: [
      [1.0, 2.0, 3.0]
    ])
    let res = try Matrix(rows: [
      [1.0, 2.0, 3.0],
      [2.0, 4.0, 6.0],
      [3.0, 6.0, 9.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply12() throws {
    let a = try Matrix(rows: [
      [1.0, 0.0]
    ])
    let b = try Matrix(rows: [
      [2.0],
      [3.0],
    ])
    let res = try Matrix(rows: [
      [2.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply13() throws {
    let a = try Matrix(rows: [
      [1.0]
    ])
    let b = try Matrix(rows: [
      [2.0, 3.0]
    ])
    let res = try Matrix(rows: [
      [2.0, 3.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply14() throws {
    let a = try Matrix(rows: [
      [1.0]
    ])
    let b = try Matrix(rows: [
      [2.0]
    ])
    let res = try Matrix(rows: [
      [2.0]
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiply15() throws {
    let a = try Matrix(rows: [
      [1.0, 2.0],
      [3.0, 4.0],
      [5.0, 6.0],
    ])
    let b = try Matrix(rows: [
      [1.0],
      [2.0],
    ])
    let res = try Matrix(rows: [
      [5.0],
      [11.0],
      [17.0],
    ])
    XCTAssertEqual(try a * b, res)
  }

  func testMatrixMultiplyLarge() throws {
    // Create a large matrix A (1000x1000) filled with 1.0
    var matrixA = [[Double]]()
    for _ in 0..<1000 {
      var row = [Double]()
      for _ in 0..<1000 {
        row.append(1.0)
      }
      matrixA.append(row)
    }

    // Create a large matrix B (1000x1000) filled with 2.0
    var matrixB = [[Double]]()
    for _ in 0..<1000 {
      var row = [Double]()
      for _ in 0..<1000 {
        row.append(2.0)
      }
      matrixB.append(row)
    }

    let a = try Matrix(rows: matrixA)
    let b = try Matrix(rows: matrixB)

    // The result should be a 1000x1000 matrix filled with 2000.0
    var expectedMatrix = [[Double]]()
    for _ in 0..<1000 {
      var row = [Double]()
      for _ in 0..<1000 {
        row.append(2000.0)
      }
      expectedMatrix.append(row)
    }

    let res = try Matrix(rows: expectedMatrix)

    XCTAssertEqual(try a * b, res)
  }
}
