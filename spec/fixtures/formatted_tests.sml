fun test desc condition = print(desc^" "^Bool.toString(condition)^"\n")
fun headString "" = "" | headString s  = String.extract (s, 0, SOME 1)
fun tailString "" = "" | tailString s  = String.extract (s, 1, NONE)
val allDefined_test1 = test "allDefined_test1" (allDefined [NONE,SOME 7,SOME 3,NONE, SOME 7] = [7,3,7])
val allDefined_test2 = test "allDefined_test2" (allDefined [NONE,NONE,NONE] = [])
local
fun f x = x+2
fun h x = x*2
fun g x = x div 2
in
val dollar_test1 = test "dollar_test1" (g (h (f (g (h 2)))) = g $ h $ f $ g $ h 2)
end
val countdown_test2 = test "countdown_test2" ((countdown ~1; false) handle Domain => true | _ => false)
val svgLine_test1 = test "svgLine_test1" (svgLine [(0,0), (100,100), (200,0)] = "<svg xmlns=\"http://www.w3.org/2000/svg\""^ "style=\"stroke: black; stroke-width: 2px;\">"^ "<line x1=\"0\" y1=\"0\" x2=\"100\" y2=\"100\" />"^ "<line x1=\"100\" y1=\"100\" x2=\"200\" y2=\"0\" />"^ "</svg>")
