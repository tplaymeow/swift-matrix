import CLapack
import COpenBLAS

extension Float: LinearAlgebraScalar {
  @_transparent
  public static func LAPACKE_getrf(
    _ matrix_layout: Int32,
    _ m: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Float>!,
    _ lda: Int32,
    _ ipiv: UnsafeMutablePointer<Int32>!
  ) -> Int32 {
    LAPACKE_sgetrf(matrix_layout, m, n, a, lda, ipiv)
  }

  @_transparent
  public static func LAPACKE_getri(
    _ matrix_layout: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Float>!,
    _ lda: Int32,
    _ ipiv: UnsafePointer<Int32>!
  ) -> Int32 {
    LAPACKE_sgetri(matrix_layout, n, a, lda, ipiv)
  }

  @_transparent
  public static func cblas_gemm(
    _ Order: CBLAS_ORDER,
    _ TransA: CBLAS_TRANSPOSE,
    _ TransB: CBLAS_TRANSPOSE,
    _ M: blasint,
    _ N: blasint,
    _ K: blasint,
    _ alpha: Float,
    _ A: UnsafePointer<Float>!,
    _ lda: blasint,
    _ B: UnsafePointer<Float>!,
    _ ldb: blasint,
    _ beta: Float,
    _ C: UnsafeMutablePointer<Float>!,
    _ ldc: blasint
  ) {
    cblas_sgemm(Order, TransA, TransB, M, N, K, alpha, A, lda, B, ldb, beta, C, ldc)
  }

  @_transparent
  public static func cblas_omatcopy(
    _ CORDER: CBLAS_ORDER,
    _ CTRANS: CBLAS_TRANSPOSE,
    _ crows: blasint,
    _ ccols: blasint,
    _ calpha: Float,
    _ a: UnsafePointer<Float>!,
    _ clda: blasint,
    _ b: UnsafeMutablePointer<Float>!,
    _ cldb: blasint
  ) {
    cblas_somatcopy(CORDER, CTRANS, crows, ccols, calpha, a, clda, b, cldb)
  }
}
