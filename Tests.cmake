include(CTest)

# Generate custom target build_tests
function(generate_build_tests)
    add_custom_target(build_tests)
endfunction()

# Generate a test target, basename of source + _test will be test name
# basename of source + _test_binary will be test binary's name
function(generate_test source)
    get_filename_component(test_executable_base ${source} NAME_WE)
    add_executable(${test_executable_base}_test_binary tests/${source})

    if(ARGC GREATER 1)
        target_link_libraries(${test_executable_base}_test_binary ${ARGV1})
    endif()

    add_test(NAME ${test_executable_base}_test
        COMMAND ${test_executable_base}_test_binary)
    add_dependencies(build_tests ${test_executable_base}_test_binary)
endfunction()
