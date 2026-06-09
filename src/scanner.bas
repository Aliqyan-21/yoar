#include "dir.bi"
#include "scanner.bi"

function normalize_path(path as string) as string
  dim result as string = path
  do while instr(result, "/../") <> 0
    var posi = instr(result, "/../")
    var left_part = left(result, posi - 1)
    var ls = instrrev(left_part, "/")
    result = left(result, ls) & mid(result, posi + 4)
  loop
  return result
end function

function resolve_include_in_dir(filename as string, search_dir as string) as string
  var f = search_dir & "/" & filename
  if dir(f) <> "" then return f end if

  dim subdirs() as string
  var subdir_count = 0
  var curr_cap = 0 ' capacity of subdirs()

  var subdir = dir(search_dir & "/*", fbDirectory)
  do while subdir <> ""
    if subdir <> "." and subdir <> ".." then
      if subdir_count >= curr_cap then
        curr_cap += CHUNK_SIZE
        redim preserve subdirs(curr_cap - 1)
      end if
      subdirs(subdir_count) = subdir
      subdir_count += 1
    end if
    subdir = dir()
  loop

  if subdir_count > 0 then
    redim preserve subdirs(subdir_count - 1)
  else
    erase subdirs
  end if

  for i as integer = 0 to subdir_count - 1
    var found = resolve_include_in_dir(filename, search_dir & "/" & subdirs(i))
    if found <> "" then return found end if
  next

  return ""
end function

function resolve_include(filename as string, includes() as string, include_count as integer, base_dir as string) as string
  dim pwd as string = environ("PWD")
  for i as integer = 0 to include_count - 1
    dim search_dir as string
    if left(base_dir, 1) = "/" then
      search_dir = normalize_path(base_dir & "/" & includes(i))
    else
      search_dir = normalize_path(pwd & "/" & base_dir & "/" & includes(i))
    end if
    var found = resolve_include_in_dir(filename, search_dir)
    if found <> "" then return found
  next
  return ""
end function

sub scan_file_recursive(filepath as string, includes() as string, include_count as integer, base_dir as string, sp as ScanPut)
  dim inf as ubyte = freefile
  if open(filepath for input as #inf) <> 0 then
    print "[warning] could not open for scanning: " & filepath
    return
  end if

  dim ln as string
  do while not eof(inf)
    line input #inf, ln
    ln = trim(ln)
    if ln = "" or left(ln, 1) = "'" then continue do end if

    var lln = lcase(ln)
    if left(lln, 8) <> "#include" then continue do end if

    ' determine '"' pos and extracting
    var p1 = instr(lln, !"\"")
    var p2 = instrrev(lln, !"\"")
    if p1  = 0 or p2 = 0 then continue do
    var incfile = mid(ln, p1 + 1, p2 - p1 - 1)
    if incfile = "" then continue do end if

    ' path resolving '
    var full_path = resolve_include(incfile, includes(), include_count, base_dir)
    if full_path = "" then continue do end if

    full_path = normalize_path(full_path)

    ' avoid duplicates '
    dim already as boolean = false
    for i as integer = 0 to sp.include_count - 1
      if sp.includes(i) = full_path then
        already = true
        exit for
      end if
    next
    if not already then
      if sp.include_count >= sp.include_cap then
        sp.include_cap += CHUNK_SIZE
        redim preserve sp.includes(sp.include_cap - 1)
      end if
      sp.includes(sp.include_count) = full_path
      sp.include_count += 1
      if lcase(right(full_path, 3)) = ".bi" then
        scan_file_recursive(full_path, includes(), include_count, base_dir, sp)
      end if
    end if
  loop

  close #inf
end sub

' extract #include "utils.bi" from file '
function scan_includes(filepath as string, includes() as string, include_count as integer, base_dir as string) as ScanPut
  dim sp as ScanPut
  scan_file_recursive(filepath, includes(), include_count, base_dir, sp)
  return sp
end function
