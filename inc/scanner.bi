type ScanPut
  includes(32) as string
  include_count as integer = 0
end type

declare function scan_includes(filepath as string, includes() as string, include_count as integer, base_dir as string) as ScanPut
