type Cargs
  base_dir as string = "."
  target as string = "release"
end type

declare function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
