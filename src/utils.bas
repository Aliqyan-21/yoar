#include "utils.bi"

sub usage(prog as string)
  print "usage: " & prog & !" [options] [directory in which yaorfile is (default: \".\")]"
  print "options: "
  print "  --target, -t       : specify build target (default: release)"
  print "  --version, -v      : display program version and quit"
  print "  --help, -h         : show this help message and quit"
  print "  --init             : initialize a yoarfile template"
  end 0
end sub

function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
  dim args as Cargs

  for i as integer = 1 to argc - 1
    dim arg as string = *argv[i]
    arg = trim(arg)
    if ((arg = "--target" or arg = "-t") and ((i + 1) < argc)) then
      args.target = *argv[i+1]
      i+=1
    elseif arg = "--init" then
      args.init = true
    elseif arg = "--help" or arg = "-h" then
      args.help = true
    elseif arg = "--version" or arg = "-v" then
      args.version = true
    else
      args.base_dir = *argv[i]
    end if
  next

  return args
end function

' extract "parser" from path like "../src/parser.bas"
function basename(path as string) as string
  dim result as string
  var ls = instrrev(path, "/")
  var ld = instrrev(path, ".")

  if ld < ls then ld = 0 end if /' skip if suppose ../src.old/... '/

  if (ld <> 0) then
    result = mid(path, ls+1, ld - ls - 1)
  end if

  return result
end function
