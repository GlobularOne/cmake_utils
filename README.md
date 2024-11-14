# cmake_utils

Cmake_utils is a project containing several cmake functions to eliminate CMake boilercode.
The aim is to make the `CMakeLists.txt` file short by providing functions that do what most projects would likely want done, standardizing behavior without eliminating the freedom to customize.

## Features

Cmake_utils provides several files and each file provides several functions, covering common expected behavior. For example, `Library.cmake` allows you to generate libraries that automatically discover sources, public headers and so version.

* Significantly reduces boilerplate code.

* Allows for standardizing project directory structure.

* Provides utility functions for almost all a cmake-based project would need.

## Usage

For usage of this project, see the [wiki](https://github.com/GlobularOne/cmake_utils/wiki).

## Contacting the author

You can always send an email to me. I am available as `GlobularOne@proton.me`.

## License

MIT License. See the [LICENSE](https://github.com/GlobularOne/cmake_utils/blob/main/LICENSE) file for more information.
