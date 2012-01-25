package knock {
  import stdio.flash.Sprite
  import stdio.process

  public class Test extends Sprite {
    public static var current: Test = null

    public var failed: Boolean = false

    override public function main(): void {
      current = this
      run(function (): void {
        process.exit(failed ? -1 : 0)
      })
    }

    public function run(callback: Function): void {
      callback()
    }
  }
}
