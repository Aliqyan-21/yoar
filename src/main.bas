#include "generator.bi"
#include "utils.bi"
#include "scanner.bi"

sub main(argc as integer, argv as zstring ptr ptr)
    dim args as Cargs = parse_args(argc, argv)

    print "target = " & args.target
    print "searching yoarfile at = " & args.base_dir & "/"

    dim path as string
    path = args.base_dir & "/yoarfile"

    if generate_makefile(path, args.base_dir, args.target) then
        print "yoar: makefile generated successfully"
    else
        print "yoar: failed"
        end 1
    end if
end sub

' main(__FB_ARGC__, __FB_ARGV__)
var mi = scan_includes("../src/main.bas")
print "main:"
for i as integer = 0 to mi.include_count - 1
  print mi.includes(i)
next
var ui = scan_includes("../src/utils.bas")
print "utils:"
for i as integer = 0 to ui.include_count - 1
  print ui.includes(i)
next
var gi = scan_includes("../src/generator.bas")
print "generator:"
for i as integer = 0 to gi.include_count - 1
  print gi.includes(i)
next
