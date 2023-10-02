extension Matrix where Element: FloatingPoint {
  // Only for unit tests
  internal static func almostEqual(
    _ left: Self,
    _ right: Self,
    accuracy: Element
  ) -> Bool {
    left.rows == right.rows
      && left.columns == right.columns
      && zip(left.data, right.data)
        .allSatisfy { abs($1 - $0) < accuracy }
  }
}
