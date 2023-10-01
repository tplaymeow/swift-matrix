public struct MatrixError: Error {
  public let description: String

  @usableFromInline
  init(description: String) {
    self.description = description
  }
}

extension MatrixError: CustomStringConvertible {}
