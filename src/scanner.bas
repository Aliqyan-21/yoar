#include "scanner.bi"

' extract #include "utils.bi" from file '
function scan_includes(filepath as string, fbc as string, includes_flags as string) as ScanPut
  dim sp as ScanPut
  dim tmp as string = ".yoar_deps.txt"
  dim tmpo as string = ".yoar_tmp.o"

  shell fbc & " -showincludes " & includes_flags _
    & " -c " & filepath & " -o tmpo > " & tmp & " 2>&1"

  dim inf as ubyte = freefile
  if open(tmp for input as #inf) <> 0 then return sp

  dim ln as string
  do while not eof(inf)
    line input #inf, ln
    ' lines with includes look like: " |  path/to/file.bi"
    if instr(ln, " |  /") <> 0 then
      var ls = instr(ln, "/")
      sp.includes(sp.include_count) = mid(ln, ls)
      sp.include_count += 1
    end if
  loop

  close #inf

  '' cleanup the tmp files created ''
  kill tmp
  kill tmpo

  return sp
end function
