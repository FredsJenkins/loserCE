# install binary
install(TARGETS loserCE DESTINATION loserCE/bin)

# install libs
# install(TARGETS mylib_shared DESTINATION cmake-example/lib)
# install(TARGETS mylib_static DESTINATION cmake-example/lib)

# install headers
# install(FILES ${PROJECT_SOURCE_DIR}/src/mylib.h DESTINATION cmake-example/include)

# cpack
include(InstallRequiredSystemLibraries)
# set(CPACK_RESOURCE_FILE_LICENSE "${PROJECT_SOURCE_DIR}/LICENSE")
set(CPACK_PACKAGE_VERSION_MAJOR "${VERSION_MAJOR}")
set(CPACK_PACKAGE_VERSION_MINOR "${VERSION_MINOR}")
set(CPACK_PACKAGE_VERSION_PATCH "${VERSION_PATCH}")
set(CPACK_PACKAGE_CONTACT " ")
include(CPack)
