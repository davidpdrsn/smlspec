(*
  headString : string -> string
  return the first letter in a string
  if the string is empty just return an empty string
*)
fun headString "" = ""
  | headString s  = String.extract (s, 0, SOME 1)

(*
  tailString : string -> string
  return everything but the first letter of a string
  if the string is empty just return an empty string
*)
fun tailString "" = ""
  | tailString s  = String.extract (s, 1, NONE)

val allDefined_test1 = allDefined [NONE,SOME 7,SOME 3,NONE, SOME 7] = [7,3,7]
val allDefined_test2 = allDefined [NONE,NONE,NONE] = []
val allDefined_test3 = allDefined [SOME "a", NONE, SOME "b", SOME "foo"] =
                                      ["a","b","foo"]
val allDefined_test4 = allDefined [] = []
val allDefined_test5 = allDefined [NONE, NONE] = []

local
  fun f x = x+2
  fun h x = x*2
  fun g x = x div 2
in
  val dollar_test1 = g (h (f (g (h 2)))) = g $ h $ f $ g $ h 2
end

val countdown_test2 = (countdown ~1; false) handle Domain => true | _ => false
val countdown_test3 = countdown 0 = [0]

val lines_test1 = lines [(0,0), (100,100), (200,0)] =
  "line one"^
  "line two"

val svgLine_test1 = svgLine [(0,0), (100,100), (200,0)] =
  "<svg xmlns=\"http://www.w3.org/2000/svg\""^
      "style=\"stroke: black; stroke-width: 2px;\">"^
    "<line x1=\"0\" y1=\"0\" x2=\"100\" y2=\"100\" />"^
    "<line x1=\"100\" y1=\"100\" x2=\"200\" y2=\"0\" />"^
  "</svg>"

val optimiseMark_test6 = optimise' [Move 5, Repeat (0, [Move 5])] = [Move 5]
val optimiseMark_test7 = optimise' [Move 5, Turn, Turn,
                                    Repeat(0, [Move 5]), Turn, Turn, Move 37] =
                                   [Move 5, Turn, Turn, Turn, Turn, Move 37]
