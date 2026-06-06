#include "generator.bi"
#include "utils.bi"

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

main(__FB_ARGC__, __FB_ARGV__)
