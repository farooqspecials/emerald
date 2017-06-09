const tarraytype <- object tarraytype
  initially
    var x : Array.of[String]

     x <- Array.of[String].empty
    stdout.putstring[(Array.of[String] *> Array.of[Integer]).asstring]
    stdout.putchar['\n']
  end initially
end tarraytype
