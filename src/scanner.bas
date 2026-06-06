#include "scanner.bi"

' extract #include "utils.bi" from file '
function scan_includes(filepath as string, fbc as string, includes_flags as string) as ScanPut
  dim sp as ScanPut
  dim tmp as string = "/tmp/yoar_deps.txt"

  shell fbc & " -showincludes " & includes_flags & " -c " & filepath & " -o /tmp/yoar_tmp.o > " & tmp & " 2>&1"

  dim inf as ubyte = freefile
  if open(tmp for input as #inf) <> 0 then
    print("file not found: " & filepath)
    end 1
  end if

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
  return sp
end function
