# Set C standard, defaults to C99
function(set_c_standard)
  if("C" IN_LIST LANGUAGES)
    if(ARGC EQUAL 1)
      set(C_STANDARD
          ${ARGV0}
          PARENT_SCOPE)
    else()
      set(C_STANDARD
          99
          PARENT_SCOPE)
    endif()
  endif()
endfunction()

# Set C++ standard, defaults to C++14
function(set_cxx_standard)
  if("CXX" IN_LIST LANGUAGES)
    if(ARGC EQUAL 1)
      set(CXX_STANDARD
          ${cxx_standard}
          PARENT_SCOPE)
    else()
      set(CXX_STANDARD
          14
          PARENT_SCOPE)
    endif()
  endif()
endfunction()
