fun test desc condition = print(desc^" "^Bool.toString(condition)^"\n")
fun foo _ = 3
val foo_test1 = test "foo_test1" (foo 3 = 3)
val foo_test2 = test "foo_test2" (foo 3 = 2 lkasdjf)