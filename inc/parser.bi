'' yoarfile parser

Type YoarConfig
  ' [project]
  proj_name as string
  proj_version as string
  proj_output as string

  ' [compiler]
  fbc as string

  ' [sources] // fixed array is there for now
  sources(64) as string
  source_count as integer

  ' [includes]
  includes(64) as string
  include_count as integer

  ' [libs]
  libs(32) as string
  lib_count as integer

  ' [links]
  links(32) as string
  link_count as integer
end type

declare function parse_yoar_file(filename as string, config as YoarConfig) as Integer
