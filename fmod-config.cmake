add_library(FMOD::FMOD SHARED IMPORTED)
get_filename_component(FMOD_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
if (WIN32)
    cmake_path(SET FMOD_DLL_PATH_DEBUG NORMALIZE ${FMOD_BASE_DIR}/debug/bin/fmod.dll)
    cmake_path(SET FMOD_LIB_PATH_DEBUG NORMALIZE ${FMOD_BASE_DIR}/debug/lib/fmod_vc.lib)
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_LOCATION_DEBUG "${FMOD_DLL_PATH_DEBUG}"
        IMPORTED_IMPLIB_DEBUG "${FMOD_LIB_PATH_DEBUG}"
    )

    cmake_path(SET FMOD_DLL_PATH_RELEASE NORMALIZE ${FMOD_BASE_DIR}/bin/fmod.dll)
    cmake_path(SET FMOD_LIB_PATH_RELEASE NORMALIZE ${FMOD_BASE_DIR}/lib/fmod_vc.lib)
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_LOCATION_RELEASE "${FMOD_DLL_PATH_RELEASE}"
        IMPORTED_IMPLIB_RELEASE "${FMOD_LIB_PATH_RELEASE}"
    )

elseif (APPLE)
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_IMPLIB_DEBUG "${FMOD_BASE_DIR}/debug/lib/libfmod.dylib"
    )
    set_target_properties(
        FMOD::FMOD PROPERTIES
        IMPORTED_IMPLIB_RELEASE "${FMOD_BASE_DIR}/lib/libfmod.dylib"
    )
endif()

target_include_directories(FMOD::FMOD INTERFACE "${FMOD_BASE_DIR}/include")
