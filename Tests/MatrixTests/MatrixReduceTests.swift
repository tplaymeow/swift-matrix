import XCTest
@testable import Matrix

final class MatrixReduceTests: XCTestCase {
    func testReduceInto() throws {
        let matrix = try Matrix(rows: 2, columns: 2, elements: [1, 2, 3, 4])
        let sum = matrix.reduce(into: 0) { $0 += $1 }
        XCTAssertEqual(sum, 10)
    }

    func testReduce() throws {
        let matrix = try Matrix(rows: 2, columns: 2, elements: [1, 2, 3, 4])
        let product = matrix.reduce(1) { $0 * $1 }
        XCTAssertEqual(product, 24)
    }

    func testReduceAxisInto() throws {
        let matrix = try Matrix(rows: 2, columns: 2, elements: [1, 2, 3, 4])
        let columnSumMatrix = matrix.reduce(axis: .column, into: 0) { $0 += $1 }
        XCTAssertEqual(columnSumMatrix, Matrix(rows: 2, columns: 1, data: [4, 6]))
    }

    func testReduceAxis() throws {
        let matrix = try Matrix(rows: 2, columns: 2, elements: [1, 2, 3, 4])
        let rowProductMatrix = matrix.reduce(axis: .row, 1) { $0 * $1 }
        XCTAssertEqual(rowProductMatrix, Matrix(rows: 2, columns: 1, data: [2, 12]))
    }
}
