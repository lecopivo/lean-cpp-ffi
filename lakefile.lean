import Lake
open Lake DSL

package «FFI» {
}

@[default_target]
lean_exe «FFI» {
  root := `Main
  moreLinkArgs := #["-lstdc++"]
}


target ffi.o pkg : FilePath := do
  let oFile := pkg.buildDir / "c" / "ffi.o"
  let srcJob ← inputFile <| pkg.dir / "c" / "ffi.cpp"
  let flags := #["-I", (← getLeanIncludeDir).toString, "-fPIC"]
  buildO "ffi.cpp" oFile srcJob flags "c++"

extern_lib libleanffi pkg := do
  let name := nameToStaticLib "leanffi"
  let ffiO ← fetch <| pkg.target ``ffi.o
  buildStaticLib (pkg.nativeLibDir / name) #[ffiO]
