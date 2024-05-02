add_library(FMOD::FMOD SHARED IMPORTED)
get_filename_component(FMOD_BASE_DIR "${CMAKE_CURRENT_LIST_DIR}/../../" ABSOLUTE)

# add info about location of the dynamic library file
set_target_properties(
    FMOD::FMOD PROPERTIES
    IMPORTED_IMPLIB "${FMOD_BASE_DIR}/lib/libFMOD.dylib"
)

target_include_directories(FMOD::FMOD INTERFACE "${FMOD_BASE_DIR}/include")
