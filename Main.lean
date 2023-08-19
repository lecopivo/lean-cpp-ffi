
@[extern "print_int"]
opaque printInt (n : USize) : USize := n



def main : IO Unit :=
  IO.println s!"from lean, n = {printInt 42}"
