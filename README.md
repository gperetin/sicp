# SICP solutions

![SICP](https://mitpress.mit.edu/sicp/full-text/book/cover.jpg)

This is a repository with my notes and solution to exercises from the
[SICP](https://mitpress.mit.edu/sicp/full-text/book/book.html) book.

For each chapter I'm trying to do all the exercises (including those which are
math heavy) as well as have a `notes.md` file with notes I took when reading
that chapter.

If you find a bug or have a better solution to an exercise, I'd be happy to
hear about it, please open an issue or a PR. :)

## Trying out examples

All examples are runnable using [Chicken Scheme](http://code.call-cc.org/).
There are some differences from MIT Scheme which is used in the book, eg.
`runtime` command in MIT Scheme is current-milliseconds in Chicken Scheme. In
those cases I followed Chicken Scheme, so some examples might not be runnable
with MIT scheme.

If you're on Mac I suggest using [Homebrew](http://brew.sh/) to install
Chicken:

    brew install chicken


To play with examples, checkout the code and start a REPL, eg.:

    csi 1.2/e-1.20.scm
    #;1> (gcd 20 25)
    5
