# C++ Shared Library Makefile autogenerated by premake
# Don't edit this file! Instead edit `premake.lua` then rerun `make`

ifndef CONFIG
  CONFIG=Debug
endif

ifeq ($(CONFIG),Debug)
  BINDIR := ../../bin
  LIBDIR := ../../lib
  OBJDIR := obj_gnu_UnitTest_DIS_debug
  OUTDIR := ../../bin
  CPPFLAGS := -MMD -D "WIN32" -D "_DEBUG" -D "_CONSOLE" -I "../../cpp" -I "../../CppUtils" -I "$(CPPUNIT_INC)"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -g
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -L"$(CPPUNIT_LIB)" -lDIS_debug -lcppunit
  LDDEPS := ../../bin/DIS_debug.dll
  RESFLAGS := -D "WIN32" -D "_DEBUG" -D "_CONSOLE" -I "../../cpp" -I "../../CppUtils" -I "$(CPPUNIT_INC)"
  TARGET := UnitTest_DIS_debug.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

ifeq ($(CONFIG),Release)
  BINDIR := ../../bin
  LIBDIR := ../../lib
  OBJDIR := obj_gnu_UnitTest_DIS
  OUTDIR := ../../bin
  CPPFLAGS := -MMD -D "WIN32" -D "_CONSOLE" -I "../../cpp" -I "../../CppUtils" -I "$(CPPUNIT_INC)"
  CFLAGS += $(CPPFLAGS) $(TARGET_ARCH) -O2
  CXXFLAGS := $(CFLAGS)
  LDFLAGS += -L$(BINDIR) -L$(LIBDIR) -s -L"$(CPPUNIT_LIB)" -lDIS -lcppunit
  LDDEPS := ../../bin/DIS.dll
  RESFLAGS := -D "WIN32" -D "_CONSOLE" -I "../../cpp" -I "../../CppUtils" -I "$(CPPUNIT_INC)"
  TARGET := UnitTest_DIS.exe
  BLDCMD = $(CXX) -o $(OUTDIR)/$(TARGET) $(OBJECTS) $(LDFLAGS) $(RESOURCES) $(TARGET_ARCH)
endif

OBJECTS := \
	$(OBJDIR)/DataStreamTests.o \
	$(OBJDIR)/IncomingMessageTests.o \
	$(OBJDIR)/mainTestRunner.o \
	$(OBJDIR)/PduMarshallTests.o \
	$(OBJDIR)/PduUtils.o \

RESOURCES := \

MKDIR_TYPE := msdos
CMD := $(subst \,\\,$(ComSpec)$(COMSPEC))
ifeq (,$(CMD))
  MKDIR_TYPE := posix
endif
ifeq (/bin/sh.exe,$(SHELL))
  MKDIR_TYPE := posix
endif
ifeq ($(MKDIR_TYPE),posix)
  CMD_MKBINDIR := mkdir -p $(BINDIR)
  CMD_MKLIBDIR := mkdir -p $(LIBDIR)
  CMD_MKOUTDIR := mkdir -p $(OUTDIR)
  CMD_MKOBJDIR := mkdir -p $(OBJDIR)
else
  CMD_MKBINDIR := $(CMD) /c if not exist $(subst /,\\,$(BINDIR)) mkdir $(subst /,\\,$(BINDIR))
  CMD_MKLIBDIR := $(CMD) /c if not exist $(subst /,\\,$(LIBDIR)) mkdir $(subst /,\\,$(LIBDIR))
  CMD_MKOUTDIR := $(CMD) /c if not exist $(subst /,\\,$(OUTDIR)) mkdir $(subst /,\\,$(OUTDIR))
  CMD_MKOBJDIR := $(CMD) /c if not exist $(subst /,\\,$(OBJDIR)) mkdir $(subst /,\\,$(OBJDIR))
endif

.PHONY: clean

$(OUTDIR)/$(TARGET): $(OBJECTS) $(LDDEPS) $(RESOURCES)
	@echo Linking UnitTest_DIS
	-@$(CMD_MKBINDIR)
	-@$(CMD_MKLIBDIR)
	-@$(CMD_MKOUTDIR)
	@$(BLDCMD)

clean:
	@echo Cleaning UnitTest_DIS
ifeq ($(MKDIR_TYPE),posix)
	-@rm -f $(OUTDIR)/$(TARGET)
	-@rm -rf $(OBJDIR)
else
	-@if exist $(subst /,\,$(OUTDIR)/$(TARGET)) del /q $(subst /,\,$(OUTDIR)/$(TARGET))
	-@if exist $(subst /,\,$(OBJDIR)) del /q $(subst /,\,$(OBJDIR))
	-@if exist $(subst /,\,$(OBJDIR)) rmdir /s /q $(subst /,\,$(OBJDIR))
endif

$(OBJDIR)/DataStreamTests.o: ../../UnitTestDIS/DataStreamTests.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/IncomingMessageTests.o: ../../UnitTestDIS/IncomingMessageTests.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/mainTestRunner.o: ../../UnitTestDIS/mainTestRunner.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/PduMarshallTests.o: ../../UnitTestDIS/PduMarshallTests.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

$(OBJDIR)/PduUtils.o: ../../UnitTestDIS/PduUtils.cpp
	-@$(CMD_MKOBJDIR)
	@echo $(notdir $<)
	@$(CXX) $(CXXFLAGS) -o $@ -c $<

-include $(OBJECTS:%.o=%.d)
