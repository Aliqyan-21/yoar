#include "parser.bi"

dim yc as YoarConfig
dim res as integer

res = parse_yoar_file("yoarfile", yc)

if res = 0 then
  print "parse failed"
  end 1
end if

print "parsed successfully"
