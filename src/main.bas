#include "generator.bi"

sub main()
    dim base_dir as string
    dim path as string

    if command(1) <> "" then
        base_dir = command(1)
    else
        base_dir = "."
    end if

    path = base_dir & "/yoarfile"

    if generate_makefile(path, base_dir) then
        print "yoar: makefile generated successfully"
    else
        print "yoar: failed"
        end 1
    end if
end sub

main()
