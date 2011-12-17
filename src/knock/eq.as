package knock {
  public function eq(a: *, b: *, desc: String = null): void {
    ok((Knock.equal)(a, b), desc)
  }
}
