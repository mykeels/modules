#Build simple `Dynamic Modules` for WINDOWS 
# CONSOLER
#
#Tools Needed
#	MINGWN 
#
#Or any ANSI C development tool that support building with
#a custome make file. The below command is for a typical 
#make in the MINGW Toolchain
#
#cd to the modules/dynamic_modules/consoler/  folder. 
#
#This is to ensure That the output generated are in 
#appropriate `dist` folder in modules folder. 
#Execute the below command in your command prompt of bash
#
#modules/dynamic_modules/consoler/ $ make -f Makefile-Windows.mk

# Environment
MKDIR=mkdir
GREP=grep
CCADMIN=CCadmin
RANLIB=ranlib
CC=gcc
CCC=g++
CXX=g++

# Flags
CFLAGS=
CCFLAGS=
CXXFLAGS=

# Macros
CND_PLATFORM=
CND_DLIB_EXT=dll
CND_BUILDDIR=build
CND_DISTDIR=../dist

# Object Directory
OBJECTDIR=${CND_DISTDIR}/${CND_BUILDDIR}/${CND_PLATFORM}

# Object Files
OBJECTFILES= \
	${OBJECTDIR}/console-colors.o \
	${OBJECTDIR}/consoler.o \
	${OBJECTDIR}/toot.o
	
# Link Libraries and Options
LDLIBSOPTIONS=../../../simple/src/dist/simple.dll

#${CND_DISTDIR}/${CND_PLATFORM}/consoler.${CND_DLIB_EXT}: ../../../simple/src/dist/Debug/MinGW-Windows/simple.dll

${CND_DISTDIR}/${CND_PLATFORM}/consoler.${CND_DLIB_EXT}: ${OBJECTFILES}
	${MKDIR} -p ${CND_DISTDIR}/${CND_PLATFORM}
	${LINK.c} -o ${CND_DISTDIR}/${CND_PLATFORM}/consoler.${CND_DLIB_EXT} ${OBJECTFILES} ${LDLIBSOPTIONS} -shared

${OBJECTDIR}/consoler.o: consoler.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} ${OBJECTDIR}/*d
	$(COMPILE.c) -g  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/consoler.o consoler.c
	
${OBJECTDIR}/console-colors.o: console-colors.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/console-colors.o console-colors.c
	
${OBJECTDIR}/toot.o: toot.c
	${MKDIR} -p ${OBJECTDIR}
	${RM} "$@.d"
	$(COMPILE.c) -g  -MMD -MP -MF "$@.d" -o ${OBJECTDIR}/toot.o toot.c


#This Makefile-Windows.mk was written in adaptation to the MINGW
#description using the Netbeans IDE Makefiles as Guide.
#
#If this make file does not work on your Windows PC or you use 
#alternative compiler e.g Visual Studio, Cygwin e.t.c feel free to 
#write your own Makefile and send us a pull request at 
#https://github.com/simple-lang/modules . Your make file must follow 
#the below format for request to be accepted
#
#File-Name : Makefile-Windows-{Compiler}-{WindowsVersion}.mk
#
#e.g Makefile-Windows-cygwin-Windows8.mk
#
#looking forward to your contribution
#Thank You

