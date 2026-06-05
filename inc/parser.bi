'' yoarfile parser

Type YoarConfig
  ' [project]
  proj_name as string = "main"
  proj_output as string = "."

  ' [compiler]
  fbc as string = "fbc"

  ' [sources] // fixed array is there for now
  sources(64) as string
  source_count as integer = 0

  ' [includes]
  includes(64) as string
  include_count as integer = 0

  ' [libs]
  libs(32) as string
  lib_count as integer

  ' [links]
  links(32) as string
  link_count as integer

  ' [targets]
  debug as string
  release as string
  test as string


  ' [hooks]
  pre_build as string
  post_build as string
end type

declare function parse_yoar_file(filename as string, config as YoarConfig) as Integer
