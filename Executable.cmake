# Generate an executable target, automatically discovering sources from src.
# Accepts an optional subdirectory

function(generate_executable executable_name)
    if(ARGC EQUAL 2)
        set(subdir ${ARGV1})
    else()
        set(subdir "/")
    endif()

    set(sources)
    set(sources_dir ${PROJECT_SOURCE_DIR}/src/${subdir}/)

    if("C" IN_LIST LANGUAGES)
        file(GLOB_RECURSE c_sources "${sources_dir}/*.c")
        list(APPEND sources ${c_sources})
    endif()

    if("CXX" IN_LIST LANGUAGES)
        file(GLOB_RECURSE cpp_sources "${sources_dir}/*.cpp")
        list(APPEND sources ${cpp_sources})
    endif()

    add_executable(${executable_name} ${sources})
endfunction()
