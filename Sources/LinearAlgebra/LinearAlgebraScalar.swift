import CLapack
import COpenBLAS

public protocol LinearAlgebraScalar: FloatingPoint {
  static func LAPACKE_getrf(
    _ matrix_layout: Int32,
    _ m: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Self>!,
    _ lda: Int32,
    _ ipiv: UnsafeMutablePointer<Int32>!
  ) -> Int32

  static func LAPACKE_getri(
    _ matrix_layout: Int32,
    _ n: Int32,
    _ a: UnsafeMutablePointer<Self>!,
    _ lda: Int32,
    _ ipiv: UnsafePointer<Int32>!
  ) -> Int32

  static func cblas_gemm(
    _ Order: CBLAS_ORDER,
    _ TransA: CBLAS_TRANSPOSE,
    _ TransB: CBLAS_TRANSPOSE,
    _ M: blasint,
    _ N: blasint,
    _ K: blasint,
    _ alpha: Self,
    _ A: UnsafePointer<Self>!,
    _ lda: blasint,
    _ B: UnsafePointer<Self>!,
    _ ldb: blasint,
    _ beta: Self,
    _ C: UnsafeMutablePointer<Self>!,
    _ ldc: blasint
  )

  static func cblas_omatcopy(
    _ CORDER: CBLAS_ORDER,
    _ CTRANS: CBLAS_TRANSPOSE,
    _ crows: blasint,
    _ ccols: blasint,
    _ calpha: Self,
    _ a: UnsafePointer<Self>!,
    _ clda: blasint,
    _ b: UnsafeMutablePointer<Self>!,
    _ cldb: blasint
  )
}
