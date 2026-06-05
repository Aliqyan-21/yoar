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

print "-> sources"
for i as integer = 0 to yc.source_count - 1
  print yc.sources(i)
next

print "-> includes"
for i as integer = 0 to yc.include_count - 1
  print yc.includes(i)
next

print "-> libs"
for i as integer = 0 to yc.lib_count - 1
  print yc.libs(i)
next

print "-> links"
for i as integer = 0 to yc.link_count - 1
  print yc.links(i)
next
