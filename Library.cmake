# Generates a static and shared library pair, accepts a subdirectory (lib/${subdir})
# automatically discoveres public headers
# ARGV0: library name (required)
# ARGV1: source subdirectory (defaults to /)
# ARGV2: include subdirectory (defaults to /, if ARGV1 defined, defaults to ARGV1)
# ARGV3: Disable generation of static libraries (not enabled by default)
# ARGV4: So version (defaults to project version major)
function(generate_library library_name)
    if(ARGC LESS 2)
        set(subdir "/")
    else()
        set(subdir ${ARGV1})
    endif()

    if(ARGC LESS 3)
        if(NOT(ARGV1 EQUAL "/"))
            set(include_dir ${PROJECT_SOURCE_DIR}/include/${subdir})
        else()
            set(include_dir ${PROJECT_SOURCE_DIR}/include/${subdir})
        endif()
    else()
        set(include_dir ${PROJECT_SOURCE_DIR}/include/${ARGV2})
    endif()

    if(ARGC LESS 4)
        set(no_static false)
    else()
        set(no_static ${ARGV3})
    endif()

    if(ARGC LESS 5)
        set(so_version ${PROJECT_VERSION_MAJOR})
    else()
        set(so_version ${ARGV4})
    endif()

    get_property(languages GLOBAL PROPERTY ENABLED_LANGUAGES)
    set(sources)
    set(sources_dir ${PROJECT_SOURCE_DIR}/lib/${subdir})
    file(TO_CMAKE_PATH "${sources_dir}/" sources_dir)

    if("C" IN_LIST languages)
        file(GLOB c_sources "${sources_dir}*.c")
        list(APPEND sources ${c_sources})
    endif()

    if("CXX" IN_LIST languages)
        file(GLOB cpp_sources "${sources_dir}*.cpp")
        list(APPEND sources ${cpp_sources})
    endif()

    # Add target for library
    add_library(${library_name} SHARED ${sources})

    # Add target for static library
    if(NOT no_static)
        add_library(${library_name}_static STATIC ${sources})
    endif()

    # so version
    set_target_properties(${library_name} PROPERTIES SOVERSION ${so_version})

    # Includes
    set(headers)
    file(TO_CMAKE_PATH "${include_dir}/" include_dir)

    if("C" IN_LIST languages)
        file(GLOB_RECURSE c_headers "${include_dir}/*.h")
        list(APPEND headers ${c_headers})
    endif()

    if("CXX" IN_LIST languages)
        file(GLOB_RECURSE cpp_headers "${include_dir}/*.hpp")
        list(APPEND headers ${cpp_headers})
    endif()

    list(LENGTH headers headers_len)

    if(headers_len EQUAL 0)
        message(AUTHOR_WARNING "No public headers found for library")
    else()
        set_target_properties(${library_name} PROPERTIES PUBLIC_HEADER ${headers})
    endif()
endfunction()
