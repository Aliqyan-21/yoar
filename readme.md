## YOAR

Build system for free basic.
Cmake like build system, though not completely cmake.

#### goals:
- write your config in yoarfile (ini style)
- build, include, linking.
- incremental build
- parallel building
- prebuild and posbuild hooks (custom commands)

### Get started

1. **Clone**

2. **Build**
```bash
cd yoar
make
```
> yoar binary will be built in 'bin' directory

3. **Usage**
```
./yoar --help
```

4. **Write yoarfile**
Take a look at [example](example/yoarfile) to see sample yoarfile

### Todo

version protos:
- [x] Makefile generation
- [x] Auto re-run on Yoarfile change
- [x] Target selection (-t debug/release)
- [x] Basic incremental (skip if nothing changed)

version defteros:
- [ ] Per-file compilation (.o objects)
- [ ] True incremental builds
- [ ] Percentage display
- [ ] Dependency scanner (#include tracking)
