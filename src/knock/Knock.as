package knock {
  public class Knock {
    public static var equal: Function = default_equal

    public static function default_equal(a: *, b: *): Boolean {
      return a == b
    }
  }
}
