package knock {
  import stdlib.equal
  import stdlib.inspect

  public function eq(actual: *, expected: *, desc: String = null): void {
    ok(equal(actual, expected), desc, function (): String {
      return "expected " + inspect(expected) + ", got " + inspect(actual)
    })
  }
}
