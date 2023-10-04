extension Matrix where Element: FloatingPoint {
  // Only for unit tests
  internal static func almostEqual(
    _ left: Self,
    _ right: Self,
    accuracy: Element
  ) -> Bool {
    left.size == right.size
      && zip(left.data, right.data)
        .allSatisfy { abs($1 - $0) < accuracy }
  }
}
