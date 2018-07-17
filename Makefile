#
# set LOCAL to any value to pick up the local build, otherwise uses the system buildm
#

LOCAL_BUILD_PATH=/cvs/mt/xamarin-macios/
XAMMAC_PATH=$(LOCAL_BUILD_PATH)/src/build/mac/full-64/
DYLD=$(LOCAL_BUILD_PATH)/runtime/.libs/mac

ifdef GLOBAL
XAMMAC_PATH=/Library/Frameworks/Xamarin.Mac.framework/Versions/Current//lib/x86_64/full/
DYLD=/Library/Frameworks/Xamarin.Mac.framework/Versions/Current//lib
endif

all: ncsharp.exe

ncsharp.exe: ncsharp.cs Makefile
	mcs -g -r:$(XAMMAC_PATH)/Xamarin.Mac.dll ncsharp.cs /Library/Frameworks/Mono.framework/Versions/Current//lib/mono-source-libs/Options.cs



help:
	@echo "make all                 - builds the project"
	@echo "make run COMMAND='args'  - runs netcat with the specified arguments"
	@echo "make bundle              - builds a self-contained executable"

run: ncsharp.exe
	MONO_PATH=$(XAMMAC_PATH) DYLD_LIBRARY_PATH=$(DYLD) mono --debug ncsharp.exe $(COMMAND)


bundle: ncsharp.exe
	mkbundle --simple ncsharp.exe -o ncsharp -L $(XAMMAC_PATH) --library $(DYLD)/libxammac.dylib
