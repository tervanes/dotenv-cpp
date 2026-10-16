vcpkg_from_github(
    OUT_SOURCE_PATH SOURCE_PATH
    REPO laserpants/dotenv-cpp

    REF 9275210b8abf1a551fb81e0ba45866286d764acd
    SHA512 420e8e53454553e8573331e4f4951f5458ba2871c4ce86cefa1c196aa37cb76df8f6f56847f1e6bf8682bffe5519fb556d2ff72e79206df3dc5c5f59a4a7bfe8

    HEAD_REF master

    PATCHES
        patches/01.patch
)

vcpkg_cmake_configure(
    SOURCE_PATH "${SOURCE_PATH}"
    OPTIONS
        -DBUILD_DOCS=OFF
        -DBUILD_TESTS=OFF
)

vcpkg_cmake_install()

file(REMOVE_RECURSE "${CURRENT_PACKAGES_DIR}/debug/include")

vcpkg_cmake_config_fixup(
    PACKAGE_NAME laserpants_dotenv
    CONFIG_PATH lib/cmake/laserpants_dotenv
)

vcpkg_install_copyright(
    FILE_LIST
        "${CMAKE_CURRENT_LIST_DIR}/LICENSE-upstream-BSD-3-Clause.txt"
        "${CMAKE_CURRENT_LIST_DIR}/LICENSE-tervanes.txt"
)

file(REMOVE_RECURSE
    "${CURRENT_PACKAGES_DIR}/debug"
    "${CURRENT_PACKAGES_DIR}/debug/include"
    "${CURRENT_PACKAGES_DIR}/debug/share"
    "${CURRENT_PACKAGES_DIR}/debug/lib"
    "${CURRENT_PACKAGES_DIR}/lib"
)