uname := $(shell uname -a)
ifneq ($(findstring Msys,$(uname)),)
os := Windows
arch := x86-64
exe := .exe
else
ifneq ($(findstring Darwin,$(uname)),)
os := macOS
arch := x86-64
exe :=
else
os := Linux
arch := x86-64
endif
endif

target = mame
sdl =
ptr64 = 1
mame64 = 1
mingw32 =
mingw64 =
archopts =

ifeq ($(os), Windows)
sdl = sdl
ifeq ($(arch), x86)
mingw32 = /mingw32
else
mingw64 = /mingw64
endif
else ifeq ($(os), macOS)
ifeq ($(arch), x86)
archopts = -arch i386 -mmacosx-version-min=10.14
else
archopts = -arch x86_64 -mmacosx-version-min=10.14
endif
else
endif

ifeq ($(arch), x86)
ptr64 = 0
endif

srcdir = fsbuild/_build/mame-src

all: build mame${exe}

build:
	cd ${srcdir} && make -j2 \
		ARCHOPTS="$(archopts)" \
		MINGW32=$(mingw32) \
		MINGW64=$(mingw64) \
		NOWERROR=1 \
		OSD=sdl \
		PREFIX="" \
		PTR64=$(ptr64) \
		SUBTARGET=arcade \
		TARGET=mame \
		USE_LIBSDL=1 \
		USE_QTDEBUG=0 \
		VERBOSE=1

mame${exe}: ${srcdir}/$(sdl)mame$(exe)
	cp ${srcdir}/$(sdl)mame$(exe) mame${exe}
