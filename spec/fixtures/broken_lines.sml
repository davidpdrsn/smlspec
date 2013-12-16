fun headString "" = ""
| headString s  = String.extract (s, 0, SOME 1)
fun tailString "" = "" |
tailString s  = String.extract (s, 1, NONE)
val allDefined_test1 = allDefined [NONE,SOME 7,SOME 3,NONE, SOME 7] = [7,3,7]
val allDefined_test2 = allDefined [NONE,NONE,NONE] = []
val allDefined_test3 = allDefined [SOME "a", NONE, SOME "b", SOME "foo"] =
["a","b","foo"]
val allDefined_test4 = allDefined [] = []
val allDefined_test5 = allDefined [NONE, NONE] = []
