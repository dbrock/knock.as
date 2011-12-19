knock-flash
===========

`knock-flash` is a lightweight ActionScript 3 testing library.  It
uses [`stdio-flash`][] to print test results to standard output in a
line-based format called [Knock][], which is a simplified version of
[TAP][].

Here’s an example test:

    package {
      import knock.*
    
      public class example_test extends Test {
        override public function run(): void {
          eq(1 + 2, 3, "basic arithmetic")
          eq(1.1 + 2.2, 3.3, "floating-point math")
        }
      }
    }

Let’s compile it using [`fcshc`][]:

    $ fcshc example_test.as -l knock

And now we’ll run it, using [`run-swf`][]:

    $ run-swf example_test.swf
    ok - basic arithmetic
    not ok - floating-point math
    # expected 3.3, got 3.3000000000000003

Pretty easy, right?


[`stdio-flash`]: https://github.com/dbrock/stdio-flash
[Knock]: https://github.com/chneukirchen/knock/
[TAP]: http://en.wikipedia.org/wiki/Test_Anything_Protocol
[`fcshc`]: https://github.com/dbrock/fcshd
[`run-swf`]: https://dbrock.github.com/stdio-flash/run-swf.1
