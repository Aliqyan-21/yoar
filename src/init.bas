#include "init.bi"

sub write_yoarfile
  dim of as ubyte = freefile
  if open("yoarfile" for output as #of) <> 0 then
    print "yoarfile could not be opened for writing"
    end 1
  end if
  print #of, template
  close #of
end sub

sub yoar_init()
  dim overwrite as boolean
  dim file_exists as boolean = dir("yoarfile") <> ""
  if file_exists then
    dim ch as string
    print "yoarfile already exists"
    print "do you want to overwrite it[y/n]: ";
    line input ch
    ch = trim(ch)
    if (lcase(ch) = "y") then
      overwrite = true
    else
      overwrite = false
    end if
  end if

  if not file_exists then
    write_yoarfile()
  end if

  if file_exists and overwrite then
    print "overwriting existing yoarfile"
    write_yoarfile()
  end if

  if file_exists and not overwrite then
    print "Ok yoarfile is not overwritten"
  end if
end sub
