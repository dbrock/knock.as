package {
  import knock.*

  public class example_test extends Test {
    override public function run(): void {
      ok(true)
      ok(true, "a")
      eq(1, 1, "b")
      eq(1, 2)
    }
  }
}
