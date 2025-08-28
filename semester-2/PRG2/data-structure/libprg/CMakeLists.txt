cmake_minimum_required(VERSION 3.21)

# Add header files here manually
set(HEADERS
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/libprg.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/lista_linear.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/fila.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/pilha.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/lista.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/thash.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/linearhash.h"
        "${CMAKE_CURRENT_LIST_DIR}/src/include/libprg/apb.h"
)
# Add source files here manually
set(SOURCES 
       "${CMAKE_CURRENT_LIST_DIR}/src/libprg/lista_linear.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/fila.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/pilha.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/lista.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/thash.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/linearhash.c"
        "${CMAKE_CURRENT_LIST_DIR}/src/libprg/apb.c"
)

add_library(libprg
        src/include/libprg/fila.h
        src/libprg/fila.c
        src/include/libprg/pilha.h
        src/libprg/pilha.c
        src/include/libprg/lista.h
        src/libprg/lista.c
        src/include/libprg/thash.h
        src/libprg/thash.c
        src/include/libprg/linearhash.h
        src/libprg/linearhash.c
        src/include/libprg/apb.h
        src/libprg/apb.c)
target_sources(libprg PUBLIC ${SOURCES})
target_include_directories(libprg PUBLIC ${CMAKE_CURRENT_LIST_DIR}/src/include)

target_compile_features(libprg PUBLIC c_std_17)

# https://cmake.org/cmake/help/latest/prop_tgt/AUTOGEN_TARGETS_FOLDER.html
source_group(
       TREE "${PROJECT_SOURCE_DIR}/libprg/src/include"
       PREFIX "Header Files"
       FILES ${HEADERS})

# https://cmake.org/cmake/help/latest/command/install.html
install(TARGETS libprg DESTINATION lib)
install(FILES ${HEADER_LIST} DESTINATION include)