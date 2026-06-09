const CHUNK_SIZE as integer = 32 '' increase array by this much size, everytime its filled

type ScanPut
  includes(any) as string
  include_cap as integer = 0
  include_count as integer = 0
end type

declare function scan_includes(filepath as string, includes() as string, include_count as integer, base_dir as string) as ScanPut
