# SMLspec

SML spec is a test runner for Standard ML. It lets you write very concise and short tests and still get a useful and pretty output.

## Install

1. Install [Moscow ML](https://github.com/kfl/mosml).
2. Install the gem with `gem install smlspec`.

## Example

Write some SML code like this

```sml
fun myLength [] = 0
  | myLength (_::xs) = 1 + myLength xs

val myLength_test1 = myLength [] = 0
val myLength_test2 = myLength [1, 2] = 2
val myLength_test3 = myLength ["a", "b", "c"] = 3
```

Then run `smlspec <name of file>.sml`

And you'll get output similar to this

```
...

3 tests ran, 0 red, 3 green
```

If you have failed tests you'll see something like this

```
...F


myLength_test4


4 tests ran, 1 red, 3 green
```
