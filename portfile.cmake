vcpkg_check_linkage(ONLY_DYNAMIC_LIBRARY)

file(GLOB headers "${CMAKE_CURRENT_LIST_DIR}/include/*.h" "${CMAKE_CURRENT_LIST_DIR}/include/*.hpp" "${CMAKE_CURRENT_LIST_DIR}/include/*.cs")
file(COPY ${headers} DESTINATION "${CURRENT_PACKAGES_DIR}/include/fmod")

if (WIN32)
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/fmod.dll" DESTINATION "${CURRENT_PACKAGES_DIR}/bin")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/fmod.dll" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/bin")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/fmod_vc.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/fmod_vc.lib" DESTINATION "${CURRENT_PACKAGES_DIR}/debug/lib")
elseif (APPLE)
    file(COPY "${CMAKE_CURRENT_LIST_DIR}/lib/libfmod.dylib" DESTINATION "${CURRENT_PACKAGES_DIR}/lib")
endif()

file(COPY "${CMAKE_CURRENT_LIST_DIR}/fmod-config.cmake" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}")

file(INSTALL "${CMAKE_CURRENT_LIST_DIR}/LICENSE" DESTINATION "${CURRENT_PACKAGES_DIR}/share/${PORT}" RENAME copyright)
configure_file("${CMAKE_CURRENT_LIST_DIR}/usage" "${CURRENT_PACKAGES_DIR}/share/${PORT}/usage" COPYONLY)
