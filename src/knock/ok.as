package knock {
  import stdio.process

  public function ok(
    passed: Boolean,
    description: String = null,
    diagnose: Function = null
  ): void {
    description = description === null ? "" : " - " + description

    if (passed) {
      process.puts("ok" + description)
    } else {
      process.puts("not ok" + description)

      if (diagnose !== null) {
        for each (var line: String in diagnose().split("\n")) {
          process.puts("# " + line)
        }
      }
    }
  }
}
