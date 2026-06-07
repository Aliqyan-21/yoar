#include "parser.bi"

function parse_yoar_file(filename as string, config as YoarConfig) as Integer
  dim cfg as ubyte
  cfg = freefile
  err = open(filename for input as #cfg)
  if err <> 0 then
    print("file not found: " & filename)
    return 0
  end if

  dim as string ln, cs ' current section '
  do while not eof(cfg)
    line input #cfg, ln

    '' data cleaning ''
    ' strip inline comments '
    var hpos = instr(ln , " #")
    if hpos > 0 then
      ln = trim(left(ln, hpos - 1))
    end if
    ln = trim(ln)
    if (ln = "" or left(ln, 1) = "#") then
      continue do
    end if

    if (left(ln, 1) = "[" and right(ln,1) = "]") then
      cs = trim((lcase(mid(ln, 2, len(ln) - 2))))
      continue do
    end if

    select case cs
      /'
      so this case handles those section in which there
      is key value pair like this key = value
      '/
      case "project", "compiler", "targets", "hooks"
        dim as integer eqpos = instr(ln, "=")
        if (eqpos) then
          dim as string key = trim(left(ln, eqpos -1))
          dim as string value = trim(mid(ln, eqpos + 1))

          select case cs
            case "project"
              if key = "name" then config.proj_name = value
              if key = "output" then config.proj_output = value
            case "compiler"
              if key = "fbc" then config.fbc = value
            case "targets"
              if key = "debug" then config.debug = value
              if key = "release" then config.release = value
              if key = "test" then config.test = value
            case "hooks"
              if key = "pre_build" then config.pre_build = value
              if key = "post_build" then config.post_build = value
          end select
        end if

      /'
      this case handles those section in which there
      are just values and no key-value pair
      '/
      case "sources"
        config.sources(config.source_count) = ln
        config.source_count += 1
      case "includes"
        config.includes(config.include_count) = ln
        config.include_count += 1
      case "libs"
        config.libs(config.lib_count) = ln
        config.lib_count += 1
      case "links"
        config.links(config.link_count) = ln
        config.link_count += 1
    end select

    ' print ln
  loop

  close #cfg
  return 1
end function
