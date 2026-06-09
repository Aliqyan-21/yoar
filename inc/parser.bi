'' yoarfile parser

const CHUNK_SIZE as integer = 32

Type YoarConfig
  ' [project]
  proj_name as string = "main"
  proj_output as string = "."

  ' [main]
  main as string ' required

  ' [compiler]
  fbc as string = "fbc"

  ' [sources] // fixed array is there for now
  sources(any) as string
  source_cap as integer = 0
  source_count as integer = 1

  ' [includes]
  includes(any) as string
  include_cap as integer = 0
  include_count as integer = 0

  ' [libs]
  libs(any) as string
  lib_cap as integer = 0
  lib_count as integer = 0

  ' [links]
  links(any) as string
  link_cap as integer = 0
  link_count as integer = 0

  ' [targets]
  debug as string
  release as string
  test as string

  ' [hooks]
  pre_build as string
  post_build as string
end type

declare function parse_yoar_file(filename as string, config as YoarConfig, base_dir as string) as Integer
