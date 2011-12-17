package knock {
  import stdio.process

  public function ok(passed: Boolean, desc: String = null): void {
    desc = desc === null ? "" : " - " + desc

    if (passed) {
      process.puts("ok" + desc)
    } else {
      process.puts("not ok" + desc)
    }
  }
}
