#include "generator.bi"
#include "utils.bi"
#include "scanner.bi"
#include "init.bi"

sub main(argc as integer, argv as zstring ptr ptr)
    dim args as Cargs = parse_args(argc, argv)

    if args.version then print yoar_version : end 0
    if args.help then usage(*argv[0]) : end 0
    if args.init then yoar_init() : end 0

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
