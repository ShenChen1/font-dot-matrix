#------------------------------------------------------------------------------
#              VARIABLES APPENDED TO BY INCLUDED MAKEFILE FRAGMENTS
#------------------------------------------------------------------------------


#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv
#                           GENERATED SETTINGS START                         v
#vvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvvv

# The following TYPE comment allows tools to identify the 'type' of target this
# makefile is associated with.
# TYPE: LIB_MAKEFILE

# The library name (without a "lib" prefix or ".a/.so" suffix).
#
# It may be used by the makefile fragments so is defined before including them.
#
LIB_NAME := font

# Paths to C, C++, and assembly source files.
C_SRCS   := src/font.c
CXX_SRCS :=
ASM_SRCS :=

# Path to root of object file tree.
OBJ_ROOT_DIR := obj

# Common arguments for LIB_CFLAGS
LIB_CFLAGS_DEFINED_SYMBOLS :=
LIB_CFLAGS_UNDEFINED_SYMBOLS :=
LIB_CFLAGS_OPTIMIZATION := -O2
LIB_CFLAGS_DEBUG_LEVEL := -g
LIB_CFLAGS_WARNINGS := -Wall -Werror
LIB_CFLAGS_USER_FLAGS :=

LIB_ASFLAGS_USER :=

# Common arguments for LIB_ARCHIVER_FLAGS
LIB_ARCHIVER_FLAGS := -src

# Common arguments for LIB_SOLIB_FLAGS
LIB_SOLIB_FLAGS := -shared -fPIC

# List of library specific include directories
LIB_INCLUDE_DIRS := inc

# Pre- and post- processor settings.
BUILD_PRE_PROCESS :=
BUILD_POST_PROCESS :=

# List of public include directories for -I compiler option (-I added when used).
INC_DIRS :=

#END GENERATED

#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
#                            GENERATED SETTINGS END                           ^
#^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^


#------------------------------------------------------------------------------
#                           DEFAULT TARGET
#------------------------------------------------------------------------------

# Define the variable used to echo output if not already defined.
ifeq ($(ECHO),)
ECHO := echo
endif

# Put "all" rule before included makefile fragments because they may
# define rules and we don't want one of those to become the default rule.
.PHONY : all
all : build_pre_process lib so build_post_process

#------------------------------------------------------------------------------
#                 VARIABLES DEPENDENT ON GENERATED CONTENT
#------------------------------------------------------------------------------

# Define object file directory per build configuration
CONFIG_OBJ_DIR := $(OBJ_ROOT_DIR)

# Library file name 
LIB    := lib$(LIB_NAME).a
LIB_SO := lib$(LIB_NAME).so

# Archive per build configuration
ACTIVE_CONFIG_LIB    := $(CONFIG_OBJ_DIR)/$(LIB)
ACTIVE_CONFIG_LIB_SO := $(CONFIG_OBJ_DIR)/$(LIB_SO)

# Take lists and add required prefixes.
LIB_INC_DIRS := $(addprefix -I, $(LIB_INCLUDE_DIRS) $(INC_DIRS))

# Arguments for the C preprocessor, C/C++ compiler, assembler, and linker.
LIB_CFLAGS := $(LIB_CFLAGS_DEFINED_SYMBOLS) \
              $(LIB_CFLAGS_UNDEFINED_SYMBOLS) \
              $(LIB_CFLAGS_OPTIMIZATION) \
              $(LIB_CFLAGS_DEBUG_LEVEL) \
              $(LIB_CFLAGS_WARNINGS) \
              $(LIB_CFLAGS_USER_FLAGS) \
              $(CFLAGS)

# Arguments only for the C++ compiler.
LIB_CXXFLAGS := $(CXXFLAGS)

# Arguments only for the C preprocessor.
# Prefix each include directory with -I.
LIB_CPPFLAGS := $(LIB_INC_DIRS) \
                $(CPPFLAGS)

# Arguments only for the assembler.
LIB_ASFLAGS := $(LIB_ASM_INC_DIRS) \
               $(LIB_ASFLAGS_USER) \
               $(ASFLAGS)

# Arguments only for the archiver.
LIB_ARFLAGS := $(LIB_ARCHIVER_FLAGS)

# Arguments only for the so lib.
LIB_SOFLAGS := $(LIB_SOLIB_FLAGS)

# Create list of object files to be built using the list of source files.
# The source file hierarchy is preserved in the object tree.
# The supported file extensions are:
#
# .c            - for C files
# .cxx .cc .cpp - for C++ files
# .S .s         - for assembler files
#
# Handle source files specified by --src-dir & --src-rdir differently, to
# save some processing time in calling the adjust-path macro.

OBJ_LIST_C 		:= $(patsubst %.c,%.o,$(filter %.c,$(C_SRCS)))
OBJ_LIST_CPP	:= $(patsubst %.cpp,%.o,$(filter %.cpp,$(CXX_SRCS)))
OBJ_LIST_CXX 	:= $(patsubst %.cxx,%.o,$(filter %.cxx,$(CXX_SRCS)))
OBJ_LIST_CC 	:= $(patsubst %.cc,%.o,$(filter %.cc,$(CXX_SRCS)))
OBJ_LIST_S 		:= $(patsubst %.S,%.o,$(filter %.S,$(ASM_SRCS)))
OBJ_LIST_SS		:= $(patsubst %.s,%.o,$(filter %.s,$(ASM_SRCS)))

OBJ_LIST := $(sort $(OBJ_LIST_C) $(OBJ_LIST_CPP) $(OBJ_LIST_CXX) \
				$(OBJ_LIST_CC) $(OBJ_LIST_S) $(OBJ_LIST_SS))

SDIR_OBJ_LIST_C		:= $(patsubst %.c,%.o,$(filter %.c,$(SDIR_C_SRCS)))
SDIR_OBJ_LIST_CPP	:= $(patsubst %.cpp,%.o,$(filter %.cpp,$(SDIR_CXX_SRCS)))
SDIR_OBJ_LIST_CXX 	:= $(patsubst %.cxx,%.o,$(filter %.cxx,$(SDIR_CXX_SRCS)))
SDIR_OBJ_LIST_CC 	:= $(patsubst %.cc,%.o,$(filter %.cc,$(SDIR_CXX_SRCS)))
SDIR_OBJ_LIST_S		:= $(patsubst %.S,%.o,$(filter %.S,$(SDIR_ASM_SRCS)))
SDIR_OBJ_LIST_SS	:= $(patsubst %.s,%.o,$(filter %.s,$(SDIR_ASM_SRCS)))

SDIR_OBJ_LIST := $(sort $(SDIR_OBJ_LIST_C) $(SDIR_OBJ_LIST_CPP) \
				$(SDIR_OBJ_LIST_CXX) $(SDIR_OBJ_LIST_CC) $(SDIR_OBJ_LIST_S) \
				$(SDIR_OBJ_LIST_SS))

# Relative-pathed objects that being with "../" are handled differently.
#
# Regular objects are created as 
#   $(CONFIG_OBJ_DIR)/<path>/<filename>.o
# where the path structure is maintained under the obj directory.  This
# applies for both absolute and relative paths; in the absolute path
# case this means the entire source path will be recreated under the obj
# directory.  This is done to allow two source files with the same name
# to be included as part of the project.
#
# Note: On Cygwin, the path recreated under the obj directory will be 
# the cygpath -u output path.
#
# Relative-path objects that begin with "../" cause problems under this 
# scheme, as $(CONFIG_OBJ_DIR)/../<rest of path>/ can potentially put the object
# files anywhere in the system, creating clutter and polluting the source tree.
# As such, their paths are flattened - the object file created will be 
# $(CONFIG_OBJ_DIR)/<filename>.o.  Due to this, two files specified with 
# "../" in the beginning cannot have the same name in the project.  VPATH 
# will be set for these sources to allow make to relocate the source file 
# via %.o rules.
#
# The following lines separate the object list into the flatten and regular
# lists, and then handles them as appropriate.

FLATTEN_OBJ_LIST := $(filter ../%,$(OBJ_LIST))
FLATTEN_LIB_OBJS := $(addprefix $(CONFIG_OBJ_DIR)/,$(notdir $(FLATTEN_OBJ_LIST)))

REGULAR_OBJ_LIST 		:= $(filter-out $(FLATTEN_OBJ_LIST),$(OBJ_LIST))
REGULAR_OBJ_LIST_C 		:= $(filter $(OBJ_LIST_C),$(REGULAR_OBJ_LIST))
REGULAR_OBJ_LIST_CPP	:= $(filter $(OBJ_LIST_CPP),$(REGULAR_OBJ_LIST))
REGULAR_OBJ_LIST_CXX 	:= $(filter $(OBJ_LIST_CXX),$(REGULAR_OBJ_LIST))
REGULAR_OBJ_LIST_CC 	:= $(filter $(OBJ_LIST_CC),$(REGULAR_OBJ_LIST))
REGULAR_OBJ_LIST_S 		:= $(filter $(OBJ_LIST_S),$(REGULAR_OBJ_LIST))
REGULAR_OBJ_LIST_SS		:= $(filter $(OBJ_LIST_SS),$(REGULAR_OBJ_LIST))

FLATTEN_SDIR_OBJ_LIST := $(filter ../%,$(SDIR_OBJ_LIST))
FLATTEN_SDIR_LIB_OBJS := $(addprefix $(CONFIG_OBJ_DIR)/,$(notdir $(FLATTEN_SDIR_OBJ_LIST)))

REGULAR_SDIR_OBJ_LIST 		:= $(filter-out $(FLATTEN_SDIR_OBJ_LIST),$(SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_C 	:= $(filter $(SDIR_OBJ_LIST_C),$(REGULAR_SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_CPP	:= $(filter $(SDIR_OBJ_LIST_CPP),$(REGULAR_SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_CXX 	:= $(filter $(SDIR_OBJ_LIST_CXX),$(REGULAR_SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_CC 	:= $(filter $(SDIR_OBJ_LIST_CC),$(REGULAR_SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_S 	:= $(filter $(SDIR_OBJ_LIST_S),$(REGULAR_SDIR_OBJ_LIST))
REGULAR_SDIR_OBJ_LIST_SS	:= $(filter $(SDIR_OBJ_LIST_SS),$(REGULAR_SDIR_OBJ_LIST))

VPATH := $(sort $(dir $(FLATTEN_OBJ_LIST)) $(dir $(FLATTEN_SDIR_OBJ_LIST)))

LIB_OBJS_C := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_C) \
	$(foreach s,$(REGULAR_OBJ_LIST_C),$s))

LIB_OBJS_CPP := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_CPP) \
	$(foreach s,$(REGULAR_OBJ_LIST_CPP),$s))

LIB_OBJS_CXX := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_CXX) \
	$(foreach s,$(REGULAR_OBJ_LIST_CXX),$s))

LIB_OBJS_CC := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_CC) \
	$(foreach s,$(REGULAR_OBJ_LIST_CC),$s))

LIB_OBJS_S := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_S) \
	$(foreach s,$(REGULAR_OBJ_LIST_S),$s))

LIB_OBJS_SS := $(addprefix $(CONFIG_OBJ_DIR)/,\
	$(REGULAR_SDIR_OBJ_LIST_SS) \
	$(foreach s,$(REGULAR_OBJ_LIST_SS),$s))

LIB_OBJS := $(LIB_OBJS_C) $(LIB_OBJS_CPP) $(LIB_OBJS_CXX) $(LIB_OBJS_CC) \
	$(LIB_OBJS_S) $(LIB_OBJS_SS) \
	$(FLATTEN_LIB_OBJS) $(FLATTEN_SDIR_LIB_OBJS)

# Add any extra user-provided object files.
LIB_OBJS += $(OBJS)

# Create list of dependancy files for each object file.
LIB_DEPS := $(LIB_OBJS:.o=.d)

#------------------------------------------------------------------------------
#                           BUILD PRE/POST PROCESS
#------------------------------------------------------------------------------
build_pre_process :
	$(BUILD_PRE_PROCESS)

build_post_process :
	$(BUILD_POST_PROCESS)

.PHONY: build_pre_process build_post_process

#------------------------------------------------------------------------------
#                                 TOOLS
#------------------------------------------------------------------------------

#
# Set tool default variables if not already defined.
# If these are defined, they would typically be defined in an
# included makefile fragment.
#
ifeq ($(DEFAULT_CROSS_COMPILE),)
DEFAULT_CROSS_COMPILE :=
endif

ifeq ($(DEFAULT_RM),)
DEFAULT_RM := rm -f
endif

ifeq ($(DEFAULT_CP),)
DEFAULT_CP := cp -f
endif

ifeq ($(DEFAULT_MKDIR),)
DEFAULT_MKDIR := mkdir -p
endif

#
# Set tool variables to defaults if not already defined.
# If these are defined, they would typically be defined by a
# setting in the generated portion of this makefile.
#
ifeq ($(CROSS_COMPILE),)
CROSS_COMPILE := $(DEFAULT_CROSS_COMPILE)
endif

ifeq ($(origin CC),default)
CC := $(CROSS_COMPILE)gcc -xc
endif

ifeq ($(origin CXX),default)
CXX := $(CROSS_COMPILE)gcc -xc++
endif

ifeq ($(origin AS),default)
AS := $(CROSS_COMPILE)gcc
endif

ifeq ($(origin AR),default)
AR := $(CROSS_COMPILE)ar
endif

ifeq ($(origin LD),default)
LD := $(CROSS_COMPILE)g++
endif

ifeq ($(origin RM),default)
RM := $(DEFAULT_RM)
endif

ifeq ($(NM),)
NM := $(CROSS_COMPILE)nm
endif

ifeq ($(CP),)
CP := $(DEFAULT_CP)
endif

ifeq ($(OBJDUMP),)
OBJDUMP := $(CROSS_COMPILE)objdump
endif

ifeq ($(OBJCOPY),)
OBJCOPY := $(CROSS_COMPILE)objcopy
endif

ifeq ($(MKDIR),)
MKDIR := $(DEFAULT_MKDIR)
endif

#------------------------------------------------------------------------------
#                     PATTERN RULES TO BUILD OBJECTS
#------------------------------------------------------------------------------

define compile.c
@$(ECHO) Info: Compiling $< to $@
@$(MKDIR) $(@D)
$(CC) -MP -MMD -c $(LIB_CPPFLAGS) $(LIB_CFLAGS) -o $@ $<
$(CC_POST_PROCESS)
endef

define compile.cpp
@$(ECHO) Info: Compiling $< to $@
@$(MKDIR) $(@D)
$(CXX) -MP -MMD -c $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<
$(CXX_POST_PROCESS)
endef

define compile.s
@$(ECHO) Info: Assembling $< to $@
@$(MKDIR) $(@D)
$(AS) -MP -MMD -c $(LIB_CPPFLAGS) $(LIB_CFLAGS) $(LIB_ASFLAGS) -o $@ $<
$(AS_POST_PROCESS)
endef

$(CONFIG_OBJ_DIR)/%.o: %.c
	$(compile.c)

$(CONFIG_OBJ_DIR)/%.o: %.cpp
	$(compile.cpp)

$(CONFIG_OBJ_DIR)/%.o: %.cc
	$(compile.cpp)

$(CONFIG_OBJ_DIR)/%.o: %.cxx
	$(compile.cpp)

$(CONFIG_OBJ_DIR)/%.o: %.S
	$(compile.s)

$(CONFIG_OBJ_DIR)/%.o: %.s
	$(compile.s)

#------------------------------------------------------------------------------
#                     PATTERN RULES TO INTERMEDIATE FILES
#------------------------------------------------------------------------------

$(CONFIG_OBJ_DIR)/%.s: %.c
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CC) -S $(LIB_CPPFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.s: %.cpp
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -S $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.s: %.cc
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -S $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.s: %.cxx
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -S $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.i: %.c
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CC) -E $(LIB_CPPFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.i: %.cpp
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -E $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.i: %.cc
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -E $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

$(CONFIG_OBJ_DIR)/%.i: %.cxx
	@$(ECHO) Info: Compiling $< to $@
	@$(MKDIR) $(@D)
	$(CXX) -E $(LIB_CPPFLAGS) $(LIB_CXXFLAGS) $(LIB_CFLAGS) -o $@ $<

#------------------------------------------------------------------------------
#                        TARGET RULES
#------------------------------------------------------------------------------

.PHONY : help
help :
	@$(ECHO) "Summary of Makefile targets"
	@$(ECHO) "  Build targets:"
	@$(ECHO) "    all (default) - Static library and dynamic library"
	@$(ECHO) "    lib           - Just the static library"
	@$(ECHO) "    so            - Just the dynamic library"
	@$(ECHO) "  Clean targets:"
	@$(ECHO) "    clean         - All libraries and object files"

# Handy rule to skip making libraries and just make main library.
.PHONY : lib
lib : $(LIB)
	@$(ECHO) [$(LIB) build complete]

.PHONY : so
so : $(LIB_SO)
	@$(ECHO) [$(LIB_SO) build complete]

# Clean just the library.
.PHONY : clean
clean :
	@$(RM) -r $(LIB) $(LIB_SO) $(OBJ_ROOT_DIR)
	@$(ECHO) [$(LIB_NAME) clean complete]

# Include the dependency files
-include $(LIB_DEPS)

# Delete the target of a rule if it has changed and its commands exit
# with a nonzero exit status.
.DELETE_ON_ERROR:

#------------------------------------------------------------------------------
#                         AR TARGET RULE
#------------------------------------------------------------------------------
# Rule for constructing the library file.
$(ACTIVE_CONFIG_LIB) : $(LIB_OBJS)
	@$(ECHO) Info: Archiving $@
	@$(RM) $@
	@$(MKDIR) $(@D)
	$(AR) $(LIB_ARFLAGS) $@ $^

$(ACTIVE_CONFIG_LIB_SO) : $(LIB_OBJS)
	@$(ECHO) Info: Building $@
	@$(RM) $@
	@$(MKDIR) $(@D)
	$(LD) $(LIB_SOFLAGS) -o $@ $^

$(LIB) : $(ACTIVE_CONFIG_LIB)
	@$(CP) $< $@

$(LIB_SO) : $(ACTIVE_CONFIG_LIB_SO)
	@$(CP) $< $@

# Declare $(LIB) as phony as we want to always copy prebuilt $(ACTIVE_CONFIG_LIB)
# when we switch build configurations even if $(ACTIVE_CONFIG_LIB) is not rearchived.
.PHONY: $(LIB) $(LIB_SO)