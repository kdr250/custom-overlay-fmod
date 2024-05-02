vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

set(SOURCE_PATH $ENV{VCPKG_ROOT}/custom-overlay/fmod)

file(GLOB headers "${SOURCE_PATH}/include/*.h" "${SOURCE_PATH}/include/*.hpp")
file(COPY ${headers} DESTINATION "${CURRENT_PACKAGES_DIR}/include/fmod")

file(COPY "${SOURCE_PATH}/lib/libFMOD.dylib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
file(COPY "${SOURCE_PATH}/fmod-config.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
