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
