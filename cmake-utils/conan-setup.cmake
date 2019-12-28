function(setup_conan)
    include(cmake-utils/conan)

    conan_cmake_run(
        CONANFILE conanfile.py
        BASIC_SETUP
        BUILD missing)
endfunction()
