set(CONAN_BUILD_INFO_FILE ${CMAKE_BINARY_DIR}/conanbuildinfo.cmake)

if(EXISTS ${CONAN_BUILD_INFO_FILE})
    include(${CONAN_BUILD_INFO_FILE})
else()
    message(FATAL_ERROR "The file ${CONAN_BUILD_INFO_FILE} doesn't exist, you have to run conan install first")
endif()
conan_basic_setup(TARGETS SKIP_STD)

if(CONAN_SETTINGS_COMPILER_LIBCXX STREQUAL "libstdc++")
    # TODO Test this warning works correctly and that the proposed solution in the warning message works.
    message(FATAL_ERROR "Conan is set up to build against libstdc++ (i.e. the legacy GCC ABI). We only support libstdc++11 (i.e. the new GCC ABI).\nPlease add the '-s compiler.libcxx=libstdc++11' argument when running 'conan install'.")
endif()

add_library(CryfsDependencies_range-v3 INTERFACE)
target_link_libraries(CryfsDependencies_range-v3 INTERFACE CONAN_PKG::range-v3)

add_library(CryfsDependencies_spdlog INTERFACE)
target_link_libraries(CryfsDependencies_spdlog INTERFACE CONAN_PKG::spdlog)

add_library(CryfsDependencies_boost INTERFACE)
target_link_libraries(CryfsDependencies_boost INTERFACE CONAN_PKG::boost)
