add_library(FMOD::FMOD SHARED IMPORTED)
get_filename_component(FMOD_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
if (WIN32)
    cmake_path(SET FMOD_DLL_PATH NORMALIZE ${FMOD_BASE_DIR}/bin/fmod.dll)
    cmake_path(SET FMOD_LIB_PATH NORMALIZE ${FMOD_BASE_DIR}/lib/fmod_vc.lib)
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_LOCATION "${FMOD_DLL_PATH}"
        IMPORTED_IMPLIB "${FMOD_LIB_PATH}"
    )
elseif (APPLE)
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_IMPLIB "${FMOD_BASE_DIR}/lib/libfmod.dylib"
    )
endif()

target_include_directories(FMOD::FMOD INTERFACE "${FMOD_BASE_DIR}/include")
