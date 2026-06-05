#include "parser.bi"

function parse_yoar_file(filename as string, config as YoarConfig) as Integer
  dim cfg as ubyte
  cfg = freefile
  err = open(filename for input as #cfg)
  if err <> 0 then
    print("file not found: " & filename)
    return 0
  end if

  dim ln as string
  do while not eof(cfg)
    input #cfg, ln
    print ln
  loop

  close #cfg
  return 1
end function
