# 1.1 The elements of programming

Means for combining simple ideas to form more complex ideas:

* primitive expressions - represent the simples entities
* means of combination - compound elements are build from simpler ones
* means of abstraction - compound elements can be named and manipulated

Expressions formed by delimiting a list of expressions within parentheses in
order to denote procedure application, are called **combinations**. Here are
some examples:

    (* 5 99)

    (/ 10 5)

Leftmost element is *operator*, and the other elements are called *operands*.

In Scheme we use `define` to name things.

    (define size 2)

Define is the simplest means of abstraction, it allows us to use simple names
to refer to the results of compound operations. This also means that
interpreter must maintain some sort of memory that keeps track of name-object
pairs. We call this *environment* (more precisely *global environment*).

To evaluate a combination, do the following:

* Evaluate the subexpressions of the combination
* Apply the procedure that is the valud of the leftmost subexpression (the
  operator) to the arguments that are the values of the other subexpressions
  (the operands)

Notice that this doesn't handle definitions. For instance `(define x 3)` does
not apply `define` to two arguments, since the purpose of the `define` is
precisely to associate `x` with a value. That is, `(define x 3)` is not a
combination. Such exceptions to the general evaluation rule are called
**special forms**. Each special form has it's own evaluation rule.

General form of a procedure definition is:

    (define (<name> <formal parameters>) <body>)

`name` is the symbol to be associated with the procedure definition in the
environment. `formal parameters` are the names used within the body of the
procedure to refer to the corresponding arguments. `name` and `formal
parameters` are grouped within parentheses, just as they would be in an
actual call.

Applicative order vs normal order:

* normal-order evaluation - fully expand and then reduce. Doesn't evaluate the
  operands until their value is actually needed.
* applicative-order evaluation - evaluate arguments and then apply. This is
  what interpreter uses.

## Conditional expressions and predicates

There is a special form in Lisp for performing cases analysis, called `cond`.

    (define (abs x)
      (cond ((> x 0) x)
            ((= x 0) 0)
            ((< x 0) (- x))))

`cond` has multiple *clauses*. Each clause is `(<p> <e>)`. First expression is
the *predicate*, an expression whose value is interpreted as either true or
false. Predicates of each clause are executed in order, until a predicate
returns true, in which case the interpreter returns the value of the
corresponding *consequent expression* `<e>`. If none of the `<p>` evaluates to
true, then the result of the `cond` is undefined. `else` is a special symbol
that can be used in place of a predicate.

When there are precisely two cases in the case analysis, we can use special
form `if`.

    (if <predicate> <consequent> <alternative>)

When using this form, *consequent* and *alternative* must be single
expressions.

## Procedures as black-box abstractions

Formal parameter of a procedure has a very special role in the procedure
definition, in that it doesn't matter what name the formal parameter has. Such
a name is called a *bound variable*, and we say that the procedure definition
*binds* its formal parameters.

If a variable is not bounds, we say it is *free*. The set of expressions for
which a binding defines a name is called the *scope* of that name. In a
procedure definition, the scope is the body of the procedure.

If we allow a variable `x` to be a free variable in the internal definitions,
`x` will get its value from the argument with which the enclosing procedure is
called. We call that *lexical scoping*.
