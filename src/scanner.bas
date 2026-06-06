#include "scanner.bi"

' extract #include "utils.bi" from file '
function scan_includes(filepath as string) as ScanPut
  dim sp as ScanPut

  dim inf as ubyte
  inf = freefile
  if open(filepath for input as #inf) <> 0 then
    print("file not found: " & filepath)
    end 1
  end if

  dim ln as string
  do while not eof(inf)
    line input #inf, ln
    ln = trim(ln)
    if left(ln, 8) = "#include" then
      var ic1 = instr(ln, !"\"")
      var ic2 = instrrev(ln, !"\"")
      if (ic1 <> 0) and (ic2 <> 0) then
        sp.includes(sp.include_count) = mid(ln, ic1 + 1, ic2 - ic1 - 1)
        sp.include_count += 1
      end if
    end if
  loop

  close #inf
  return sp
end function
