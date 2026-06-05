#include "parser.bi"

function parse_yoar_file(filename as string, config as YoarConfig) as Integer
  dim cfg as ubyte
  cfg = freefile
  err = open(filename for input as #cfg)
  if err <> 0 then
    print("file not found: " & filename)
    return 0
  end if

  dim as string ln, cs ' current section '
  do while not eof(cfg)
    line input #cfg, ln

    '' data cleaning ''
    ln = trim(ln)
    if (ln = "" or left(ln, 1) = "#") then
      continue do
    end if

    if (left(ln, 1) = "[" and right(ln,1) = "]") then
      cs = mid(ln, 2, len(ln) - 2)
      print "found section: " & cs
    end if

    ' print ln
  loop

  close #cfg
  return 1
end function
