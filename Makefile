CXX = g++  # Or use clang++ if you prefer
CXXFLAGS = -pedantic -std=c++11 -Wall -Wextra

INCLUDE_DIR = include
SRC_DIR = src
BUILD_DIR = build

# Detect all .cpp files in the SRC_DIR matching "exerciceX.cpp"
SRCS = $(wildcard $(SRC_DIR)/exercice*.cpp)
OBJS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%.o, $(SRCS))

# Generate executable names for each exerciceX.cpp
EXECS = $(patsubst $(SRC_DIR)/%.cpp, $(BUILD_DIR)/%, $(SRCS))

ifeq ($(OS),Windows_NT)
    MKDIR = if not exist $(BUILD_DIR) mkdir $(BUILD_DIR)
    RM = rmdir /S /Q $(BUILD_DIR)
else
    MKDIR = mkdir -p $(BUILD_DIR)
    RM = rm -rf $(BUILD_DIR)
endif

# Default target: build all executables
all: $(EXECS)

# Rule for each executable
$(BUILD_DIR)/%: $(BUILD_DIR)/%.o
	$(MKDIR)
	$(CXX) $(CXXFLAGS) $< -o $@

# Rule for compiling each .cpp into an .o file
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp
	$(MKDIR)
	$(CXX) $(CXXFLAGS) -I$(INCLUDE_DIR) -c $< -o $@

# Clean up the build directory
clean:
	$(RM)

.PHONY: all clean
