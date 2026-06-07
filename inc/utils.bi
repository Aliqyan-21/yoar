type Cargs
    base_dir as string = "."
    target   as string = "release"
    init     as boolean = false
    help     as boolean = false
    version  as boolean = false
end type

const yoar_version as string = "V0.0.3 - tritos"

declare function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
declare sub usage(prog as string)

declare function basename(path as string) as string
