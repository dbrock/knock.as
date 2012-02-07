package knock {
  import stdio.flash.Sprite
  import stdio.process

  public class Test extends Sprite {
    public static var failed: Boolean = false

    override public function main(): void {
      if ("run" in this && this["run"].length === 0) {
        this["run"](); finish()
      } else if ("run" in this && this["run"].length === 1) {
        this["run"](finish)
      } else {
        log("Please implement one of the following methods:")
        log("public function run(): void")
        log("public function run(callback: Function): void")
        process.exit(1)
      }
    }

    private function log(message: String): void {
      process.warn("knock: " + message)
    }

    private function finish(): void {
      process.exit(failed ? -1 : 0)
    }
  }
}
