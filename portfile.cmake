vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

set(SOURCE_PATH $ENV{VCPKG_ROOT}/custom-overlay/fmod)

file(GLOB headers "${SOURCE_PATH}/include/*")
file(COPY ${headers} DESTINATION "${CURRENT_PACKAGES_DIR}/include")

file(COPY "${SOURCE_PATH}/lib/libfmod.dylib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")

configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
