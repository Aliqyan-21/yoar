#include "parser.bi"

dim yc as YoarConfig
dim res as integer

res = parse_yoar_file("yoarfile", yc)

if res = 0 then
  print "parse failed"
  end 1
end if

print "parsed successfully"

print "name = " & yc.proj_name
print "version = " & yc.proj_version
print "output = " & yc.proj_output

print "fbc = " & yc.fbc

print "debug = " & yc.debug
print "release = " & yc.release
print "test = " & yc.test

print "pre_build = " & yc.pre_build
print "post_build = " & yc.post_build
