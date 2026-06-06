#include "utils.bi"

function parse_args(argc as integer, argv as zstring ptr ptr) as Cargs
  dim args as Cargs

  for i as integer = 1 to argc - 1
    dim arg as string = *argv[i]
    if ((arg = "--target" or arg = "-t") and ((i + 1) < argc)) then
      args.target = *argv[i+1]
      i+=1
    else
      args.base_dir = *argv[i]
    end if
  next

  return args
end function
