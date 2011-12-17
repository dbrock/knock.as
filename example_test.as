package {
  import knock.*

  public class example_test extends Test {
    // See `example_test.expected' for expected results.
    override public function run(): void {
      ok(true)
      ok(true, "a")
      eq(1, 1, "b")
      eq(1, 2)

      eq(123, "123")
      Knock.equal = function (a: *, b: *): Boolean { return a === b }
      eq(123, "123")
    }
  }
}
