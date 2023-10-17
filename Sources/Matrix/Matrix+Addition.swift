/// An enumeration representing errors that can occur during matrix addition and subtraction operations.
///
/// You may encounter `MatrixAdditionError` when attempting to perform addition or subtraction between matrices with incompatible sizes,
/// such as matrices with different numbers of rows or columns.
public enum MatrixAdditionError: Error, Sendable {
  /// Indicates that the matrices have incompatible sizes for addition or subtraction.
  case incorrectSize
}

extension Matrix where Element: AdditiveArithmetic {
  /// Adds two matrices together element-wise and returns the result.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand matrix in the addition operation.
  ///   - rhs: The right-hand matrix in the addition operation.
  ///
  /// - Returns: A new matrix resulting from element-wise addition of the two input matrices.
  ///
  /// - Throws: `MatrixAdditionError.incorrectSize` if the input matrices have incompatible sizes for addition.
  ///
  /// Use this operator to add two matrices together element-wise. The input matrices must have the same dimensions.
  /// The result is a new matrix of the same size as the input matrices, with each element being the sum of the corresponding elements in the input matrices.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let matrixB = Matrix(rows: 2, columns: 2, data: [5, 6, 7, 8])
  ///   let result = try matrixA + matrixB
  ///   // Resulting matrix (result):
  ///   // [[6, 8],
  ///   //  [10, 12]]
  ///   ```
  @inlinable
  public static func + (lhs: Self, rhs: Self) throws -> Self {
    guard lhs.size == rhs.size
    else {
      throw MatrixAdditionError.incorrectSize
    }
    return Matrix(
      size: lhs.size,
      data: zip(lhs.data, rhs.data).map(+)
    )
  }

  /// Adds the elements of the right-hand matrix to the corresponding elements of the left-hand matrix in place.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand matrix to which the elements are added.
  ///   - rhs: The right-hand matrix whose elements are added to the left-hand matrix.
  ///
  /// - Throws: `MatrixAdditionError.incorrectSize` if the input matrices have incompatible sizes for addition.
  ///
  /// Use this operator to add the elements of the right-hand matrix to the corresponding elements of the left-hand matrix in place.
  /// The input matrices must have the same dimensions.
  ///
  /// - Example:
  ///   ```swift
  ///   var matrixA = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let matrixB = Matrix(rows: 2, columns: 2, data: [5, 6, 7, 8])
  ///   try matrixA += matrixB
  ///   // The `matrixA` is now updated to:
  ///   // [[6, 8],
  ///   //  [10, 12]]
  ///   ```
  @inlinable
  public static func += (lhs: inout Self, rhs: Self) throws {
    guard lhs.size == rhs.size
    else {
      throw MatrixAdditionError.incorrectSize
    }
    for index in lhs.data.indices {
      lhs.data[index] += rhs.data[index]
    }
  }

  /// Subtracts the elements of the right-hand matrix from the corresponding elements of the left-hand matrix and returns the result.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand matrix in the subtraction operation.
  ///   - rhs: The right-hand matrix whose elements are subtracted from the left-hand matrix.
  ///
  /// - Returns: A new matrix resulting from element-wise subtraction of the two input matrices.
  ///
  /// - Throws: `MatrixAdditionError.incorrectSize` if the input matrices have incompatible sizes for subtraction.
  ///
  /// Use this operator to subtract the elements of the right-hand matrix from the corresponding elements of the left-hand matrix.
  /// The input matrices must have the same dimensions. The result is a new matrix of the same size as the input matrices,
  /// with each element being the difference between the corresponding elements in the input matrices.
  ///
  /// - Example:
  ///   ```swift
  ///   let matrixA = Matrix(rows: 2, columns: 2, data: [5, 6, 7, 8])
  ///   let matrixB = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   let result = try matrixA - matrixB
  ///   // Resulting matrix (result):
  ///   // [[4, 4],
  ///   //  [4, 4]]
  ///   ```
  @inlinable
  public static func - (lhs: Self, rhs: Self) throws -> Self {
    guard lhs.size == rhs.size
    else {
      throw MatrixAdditionError.incorrectSize
    }
    return Matrix(
      size: lhs.size,
      data: zip(lhs.data, rhs.data).map(-)
    )
  }

  /// Subtracts the elements of the right-hand matrix from the corresponding elements of the left-hand matrix in place.
  ///
  /// - Parameters:
  ///   - lhs: The left-hand matrix from which the elements are subtracted.
  ///   - rhs: The right-hand matrix whose elements are subtracted from the left-hand matrix.
  ///
  /// - Throws: `MatrixAdditionError.incorrectSize` if the input matrices have incompatible sizes for subtraction.
  ///
  /// Use this operator to subtract the elements of the right-hand matrix from the corresponding elements of the left-hand matrix in place.
  /// The input matrices must have the same dimensions.
  ///
  /// - Example:
  ///   ```swift
  ///   var matrixA = Matrix(rows: 2, columns: 2, data: [5, 6, 7, 8])
  ///   let matrixB = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
  ///   try matrixA -= matrixB
  ///   // The `matrixA` is now updated to:
  ///   // [[4, 4],
  ///   //  [4, 4]]
  ///   ```
  @inlinable
  public static func -= (lhs: inout Self, rhs: Self) throws {
    guard lhs.size == rhs.size
    else {
      throw MatrixAdditionError.incorrectSize
    }
    for index in lhs.data.indices {
      lhs.data[index] -= rhs.data[index]
    }
  }
}
