package knock {
  public function eq(actual: *, expected: *, desc: String = null): void {
    ok((Knock.equal)(actual, expected), desc, function (): String {
      return "expected " + inspect(expected) + ", got " + inspect(actual)
    })
  }
}
