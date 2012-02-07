package knock {
  import stdio.process

  public function ok(
    pass: Boolean,
    desc: String = null,
    diag: Function = null
  ): void {
    desc = desc === null ? "" : " - " + desc

    if (pass) {
      process.puts("ok" + desc)
    } else {
      process.puts("not ok" + desc)

      if (diag !== null) {
        for each (var line: String in diag().split("\n")) {
          process.puts("# " + line)
        }
      }

      Test.failed = true
    }
  }
}
