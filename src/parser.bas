'' yoarfile parser

Type YoarConfig
  ' [project]
  proj_name as string
  proj_version as string
  proj_output as string

  ' [compiler]
  fbc as string
  lang as string

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

function parse_yoar_file(filename as string, config as YoarConfig) as Integer
  dim cfg as ubyte
  cfg = freefile
  err = open(filename for input as #cfg)
  if err <> 0 then
    print("file not found: " & filename)
    return 0
  end if

  dim l as string
  do while not eof(cfg)
    line input #cfg, l
    print l
  loop

  close #cfg
  return 1
end function
