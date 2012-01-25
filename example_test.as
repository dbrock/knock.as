package {
  import knock.*

  public class example_test extends Test {
    // See `example_test.expected' for expected results.
    override public function run(callback: Function): void {
      ok(true)
      ok(true, "a")
      eq(1, 1, "b")
      eq(1, 2)

      eq([1, 2], [1, 2])
      eq([1, 2], [3, 4])

      eq(123, "123")
      Knock.equal = function (a: *, b: *): Boolean { return a === b }
      eq(123, "123")

      callback()
    }
  }
}
