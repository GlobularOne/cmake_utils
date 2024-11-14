include(GNUInstallDirs)

# Install executable
function(install_executable target)
    install(TARGETS ${target} RUNTIME)
endfunction()

# Install a library, it's public headers and namelink component
function(install_library target)
    install(
        TARGETS ${target}
        LIBRARY
        PUBLIC_HEADER NAMELINK_COMPONENT)
endfunction()

# Install a directory as data
function(install_data dir)
    install(DIRECTORY ${dir} TYPE DATA)
endfunction()
