fun headString "" = ""
  | headString s  = String.extract (s, 0, SOME 1)

fun tailString "" = ""
  | tailString s  = String.extract (s, 1, NONE)
