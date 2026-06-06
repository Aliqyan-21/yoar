#include "utils.bi"

sub usage(prog as string)
  print "usage: " & prog & !" [options] [directory in which yaorfile is (default: \".\")]"
  print "options: "
  print "  --target, -t       : specify build target (default: release)"
  print "  --version, -v      : display program version and quit"
  print "  --help, -h         : show this help message and quit"
  end 0
end sub

function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
  dim args as Cargs

  for i as integer = 1 to argc - 1
    dim arg as string = *argv[i]
    if ((arg = "--target" or arg = "-t") and ((i + 1) < argc)) then
      args.target = *argv[i+1]
      i+=1
    elseif ((arg = "--version" or arg = "-v") and (i < argc)) then
      print "Version: " & yoar_version
      end 0
    elseif ((arg = "--help" or arg = "-h") and (i < argc)) then
      usage(*argv[0])
    else
      args.base_dir = *argv[i]
    end if
  next

  return args
end function
