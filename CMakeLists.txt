cmake_minimum_required(VERSION 3.15)
project(RedlandBuildTest)

set(CMAKE_CXX_STANDARD 14)

find_library(RAPTOR2_STATIC_LIBRARY
        NAMES libraptor2.a
        PATHS /usr/local/lib
        )

find_path(RAPTOR2_INCLUDE_DIR
        NAMES raptor2.h
        PATHS /usr/local/include/raptor2
        )
find_library(RASQAL_STATIC_LIBRARY
        NAMES librasqal.a
        PATHS /usr/local/lib
        )

find_path(RASQAL_INCLUDE_DIR
        NAMES rasqal.h
        PATHS /usr/local/include/rasqal
        )

find_library(LIBRDF_STATIC_LIBRARY
        NAMES librdf.a
        PATHS /usr/local/lib
        )

find_path(LIBRDF_INCLUDE_DIR
        NAMES librdf.h
        PATHS /usr/local/include
        )

add_executable(RedlandBuildTest main.c)

target_include_directories(RedlandBuildTest PRIVATE
        ${RAPTOR2_INCLUDE_DIR}
        ${RASQAL_INCLUDE_DIR}
        ${LIBRDF_INCLUDE_DIR}
        )

target_link_libraries(RedlandBuildTest PRIVATE
        ${RAPTOR2_STATIC_LIBRARY}
        ${RASQAL_STATIC_LIBRARY}
        ${LIBRDF_STATIC_LIBRARY}
        curl
        xml2
        xslt
        ltdl
        )
#	sudo apt install automake autoconf libtool gtk-doc-tools
#
#	sudo apt install libxml2 libxml2-dev libxslt libxslt-dev libcurl4-openssl-dev libltdl-dev
get_target_property(LINK_LIBRARIES RedlandBuildTest LINK_LIBRARIES)
get_target_property(INCLUDE_DIRECTORIES RedlandBuildTest INCLUDE_DIRECTORIES)

message(STATUS "

LINK_LIBRARIES      ${LINK_LIBRARIES}
INCLUDE_DIRECTORIES ${INCLUDE_DIRECTORIES}

")

message(STATUS "

    RAPTOR2_STATIC_LIBRARY   ${RAPTOR2_STATIC_LIBRARY}
    RAPTOR2_INCLUDE_DIR      ${RAPTOR2_INCLUDE_DIR}

    RASQAL_STATIC_LIBRARY    ${RASQAL_STATIC_LIBRARY}
    RASQAL_INCLUDE_DIR       ${RASQAL_INCLUDE_DIR}

    LIBRDF_STATIC_LIBRARY    ${LIBRDF_STATIC_LIBRARY}
    LIBRDF_INCLUDE_DIR       ${LIBRDF_INCLUDE_DIR}

")