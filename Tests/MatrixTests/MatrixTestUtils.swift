import XCTest

@testable import Matrix

internal func XCTAssertEqual<T: FloatingPoint>(
  _ expression1: @autoclosure () throws -> Matrix<T>,
  _ expression2: @autoclosure () throws -> Matrix<T>,
  accuracy: T,
  _ message: @autoclosure () -> String = "",
  file: StaticString = #filePath,
  line: UInt = #line
) {
  let matrix1: Matrix<T>
  do {
    matrix1 = try expression1()
  } catch {
    let message = "Matrix 1: \(error.localizedDescription)"
    XCTAssert(false, message, file: file, line: line)
    return
  }

  let matrix2: Matrix<T>
  do {
    matrix2 = try expression2()
  } catch {
    let message = "Matrix 2: \(error.localizedDescription)"
    XCTAssert(false, message, file: file, line: line)
    return
  }

  guard
    Matrix.almostEqual(matrix1, matrix2, accuracy: accuracy)
  else {
    let message = "\(matrix1) is not equal to \(matrix2)"
    XCTAssert(false, message, file: file, line: line)
    return
  }
}
