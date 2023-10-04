import CLapack
import COpenBLAS

extension Double: LinearAlgebraScalar {
  @_transparent
  public static func LAPACKE_getrf(
    _ matrix_layout: Int32,
    _ m: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Double>!,
    _ lda: Int32,
    _ ipiv: UnsafeMutablePointer<Int32>!
  ) -> Int32 {
    LAPACKE_dgetrf(matrix_layout, m, n, a, lda, ipiv)
  }

  @_transparent
  public static func LAPACKE_getri(
    _ matrix_layout: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Double>!,
    _ lda: Int32,
    _ ipiv: UnsafePointer<Int32>!
  ) -> Int32 {
    LAPACKE_dgetri(matrix_layout, n, a, lda, ipiv)
  }

  @_transparent
  public static func cblas_gemm(
    _ Order: CBLAS_ORDER,
    _ TransA: CBLAS_TRANSPOSE,
    _ TransB: CBLAS_TRANSPOSE,
    _ M: blasint,
    _ N: blasint,
    _ K: blasint,
    _ alpha: Double,
    _ A: UnsafePointer<Double>!,
    _ lda: blasint,
    _ B: UnsafePointer<Double>!,
    _ ldb: blasint,
    _ beta: Double,
    _ C: UnsafeMutablePointer<Double>!,
    _ ldc: blasint
  ) {
    cblas_dgemm(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb, beta, C, ldc)
  }

  @_transparent
  public static func cblas_omatcopy(
    _ CORDER: CBLAS_ORDER,
    _ CTRANS: CBLAS_TRANSPOSE,
    _ crows: blasint,
    _ ccols: blasint,
    _ calpha: Double,
    _ a: UnsafePointer<Double>!,
    _ clda: blasint,
    _ b: UnsafeMutablePointer<Double>!,
    _ cldb: blasint
  ) {
    cblas_domatcopy(CORDER, CTRANS, crows, ccols, calpha, a, clda, b, cldb)
  }
}
