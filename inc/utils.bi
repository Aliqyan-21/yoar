type Cargs
  base_dir as string = "."
  target as string = "release"
end type

const yoar_version as string = "V0.0.1 - protos"

declare function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
declare sub usage(prog as string)
