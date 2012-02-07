knock.as
========

`knock.as` is a very lightweight ActionScript 3 testing library.
It uses [`stdio.as`][] to print test results to standard output in a
line-based format called [Knock][], which is a simplified version of
[TAP][].

Here’s an example test:

    package {
      import knock.*
    
      public class example_test extends Test {
        override public function run(callback: Function): void {
          eq(1 + 2, 3, "basic arithmetic")
          eq(1.1 + 2.2, 3.3, "floating-point math")
          callback()
        }
      }
    }

Let’s compile it using [`fcshc`][]:

    $ fcshc -lknock example_test.as

And now we’ll run it, using [`run-stdio-swf`][]:

    $ run-stdio-swf example_test.swf
    ok - basic arithmetic
    not ok - floating-point math
    # expected 3.3, got 3.3000000000000003

Pretty easy, right?


[`stdio.as`]: https://github.com/dbrock/stdio.as
[Knock]: https://github.com/chneukirchen/knock/
[TAP]: http://en.wikipedia.org/wiki/Test_Anything_Protocol
[`fcshc`]: https://github.com/dbrock/fcshd
[`run-stdio-swf`]: https://dbrock.github.com/stdio.as/run-stdio-swf.1
