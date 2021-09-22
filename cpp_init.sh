# Create Directories
mkdir src include build
# Create CMake file
touch CMakeLists.txt
cat <<EOT >>CMakeLists.txt
CMAKE_MINIMUM_REQUIRED(VERSION 3.12)

PROJECT(project)
add_executable(project.bin src/main.cpp)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED True)

# Enable Database of compiler flags for YCM
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# Uncomment this for debug
# set(CMAKE_BUILD_TYPE Debug)

target_include_directories(project.bin PRIVATE \${CMAKE_CURRENT_SOURCE_DIR}/include)
EOT

# Create source files
touch include/main.h
cat <<EOT >> include/main.h
#include <iostream>
EOT

touch src/main.cpp
cat <<EOT >> src/main.cpp
#include "main.h"
int main(int argc, char** args) {
    std::cout << "Compiled!" << std::endl;
    return EXIT_SUCCESS;
}
EOT

# Compile
cd build
cmake ../
make && ./project.bin
