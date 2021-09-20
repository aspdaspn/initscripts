# Create Directories
mkdir src include build
# Create CMake file
touch CMakeLists.txt
echo "CMAKE_MINIMUM_REQUIRED(VERSION 2.8)" > CMakeLists.txt
echo "PROJECT(project)" >> CMakeLists.txt
echo "add_executable(project.bin src/main.cpp)" >> CMakeLists.txt
echo "# set(CMAKE_BUILD_TYPE Debug)" >> CMakeLists.txt
echo "target_include_directories(project.bin PRIVATE \${CMAKE_CURRENT_SOURCE_DIR}/include)" >> CMakeLists.txt
# Create source files
touch include/main.h
echo "#include <iostream>" > include/main.h
touch src/main.cpp
echo "#include \"main.h\"" > src/main.cpp
echo "int main(int argc, char** args) {" >> src/main.cpp
echo "	std::cout << \"Compiled!\" << std::endl;" >> src/main.cpp
echo "	return EXIT_SUCCESS;" >> src/main.cpp
echo "}" >> src/main.cpp
# Compile
cd build
cmake ../
make && ./project.bin
