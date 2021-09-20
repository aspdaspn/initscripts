# Create Directories
mkdir src include build
# Create CMake file
touch CMakeLists.txt
echo "CMAKE_MINIMUM_REQUIRED(VERSION 2.8)" > CMakeLists.txt
echo "PROJECT(project)" >> CMakeLists.txt
echo "add_executable(project.bin src/main.c)" >> CMakeLists.txt
echo "# set(CMAKE_BUILD_TYPE Debug)" >> CMakeLists.txt
echo "target_include_directories(project.bin PRIVATE \${CMAKE_CURRENT_SOURCE_DIR}/include)" >> CMakeLists.txt
# Create source files
touch include/main.h
echo "#include <stdio.h>" > include/main.h
echo "#include <stdlib.h>" >> include/main.h
touch src/main.c
echo "#include \"main.h\"" > src/main.c
echo "int main(int argc, char** args) {" >> src/main.c
echo "	printf(\"Compiled!\n\");" >> src/main.c
echo "	return EXIT_SUCCESS;" >> src/main.c
echo "}" >> src/main.c
# Compile
cd build
cmake ../
make && ./project.bin
