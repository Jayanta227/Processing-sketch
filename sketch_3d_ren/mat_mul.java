public class mat_mul {
  static float[][] pdt;

  static float [][] mult(float[][] m, float[][] n) {
    pdt = new float[m.length][n[0].length];
    if (m[0].length == n.length) {

      for (int i = 0; i < m.length; i++) {
        for (int ni = 0; ni < n[0].length; ni++) {
          for (int j = 0; j < m[0].length; j++) {
            pdt[i][ni] += m[i][j] * n[j][ni];
          }
        }
      }
    }
    return pdt;
  }
  static float [][]mult(float [][]m, float []n) {
    float [][]ret = new float[n.length][1];
    for (int i =0; i<n.length; i++) {
      ret[i][0] = n[i];
    }
    return mat_mul.mult(m, ret);
  }
}
