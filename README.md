![MacOS Test](https://github.com/tplaymeow/swift-matrix/actions/workflows/test-macos.yml/badge.svg)
![Linux Test](https://github.com/tplaymeow/swift-matrix/actions/workflows/test-linux.yml/badge.svg)

# Matrix

Matrix is a Swift package that provides a flexible and efficient way to work with matrices. It offers a range of matrix operations, including creation, manipulation, and arithmetic operations.

## Features

- **Matrix Creation**: Easily create matrices of various dimensions and data types.
- **Matrix Arithmetic**: Perform matrix arithmetic operations, including addition, subtraction, multiplication, and more.
- **Matrix Transposition**: Transpose matrices to switch rows and columns.
- **Element Access**: Access individual elements, rows, and columns of a matrix.
- **Error Handling**: Handle matrix-related errors gracefully with custom error types.

## Installation

To use Matrix in your Swift project, add it as a dependency in your `Package.swift` file:

```swift
dependencies: [
  .package(url: "https://github.com/tplaymeow/swift-matrix.git", branch: "main")
]
```

Then, import the library wherever you use it in your Swift code:

```swift
import Matrix
```

## Usage

Here are some common use cases for working with matrices using Matrix:

### Creating a Matrix
```swift
let matrix = Matrix<Double>(rows: 3, columns: 3, repeating: 0.0)
```

### Matrix Arithmetic
```swift
let matrixA = Matrix(rows: 2, columns: 2, data: [1, 2, 3, 4])
let matrixB = Matrix(rows: 2, columns: 2, data: [5, 6, 7, 8])

let result = try? matrixA + matrixB
```

### Transposing a Matrix
```swift
let matrix = Matrix(rows: 3, columns: 2, data: [1, 2, 3, 4, 5, 6])
let transposedMatrix = matrix.transposed()
```

### Accessing Elements
```swift
let matrix = Matrix(rows: 3, columns: 3, data: [1, 2, 3, 4, 5, 6, 7, 8, 9])

let element = matrix[1, 2] // Access element at row 1, column 2
let row = matrix[row: 1]   // Access the second row
let column = matrix[column: 2] // Access the third column
```

## Documentation

TODO

## Contributing

Contributions are welcome! If you find a bug or have an enhancement in mind, please open an issue or submit a pull request on the GitHub repository.

## License

TODO


