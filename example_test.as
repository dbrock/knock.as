package {
  import knock.*

  public class example_test extends Test {
    // See `example_test.expected' for expected results.
    override public function run(): void {
      ok(true)
      ok(true, "a")
      eq(1, 1, "b")
      eq(1, 2)
    }
  }
}
