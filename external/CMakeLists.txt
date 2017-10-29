
###################################  google test  ###################################

# target to update git submodules
# add_custom_target(
    # update_submodules
    # COMMAND git submodule init
    # COMMAND git submodule update
    # WORKING_DIRECTORY ${PROJECT_SOURCE_DIR}
    # )

#set(GOOGLETEST_ROOT googletest/googletest CACHE STRING "Google Test source root")

# google test includes
# include_directories(
    # ${PROJECT_SOURCE_DIR}/${GOOGLETEST_ROOT}
    # ${PROJECT_SOURCE_DIR}/${GOOGLETEST_ROOT}/include
    # )

# google test sources
set(GOOGLETEST_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/googletest/googletest/src/gtest-all.cc
    ${CMAKE_CURRENT_SOURCE_DIR}/googletest/googletest/src/gtest_main.cc
    )
	
# mark these files as generated (they may not be present at configure time)
foreach(_source ${GOOGLETEST_SOURCES})
    set_source_files_properties(${_source} PROPERTIES GENERATED 1)
endforeach()

add_library(googletest ${GOOGLETEST_SOURCES})
target_include_directories(googletest PUBLIC   
	${CMAKE_CURRENT_SOURCE_DIR}/googletest/googletest
    ${CMAKE_CURRENT_SOURCE_DIR}/googletest/googletest/include
)

#Workaround for VS2015 maybe trouble with GCC
set_target_properties(googletest PROPERTIES COMPILE_DEFINITIONS GTEST_LANG_CXX11)
					  
					  
######################################  pthread  ###################################					  

 
add_library(pthread STATIC IMPORTED GLOBAL)
set_property(TARGET pthread PROPERTY IMPORTED_LOCATION ${CMAKE_CURRENT_SOURCE_DIR}/pthread/lib/x64/pthreadVC2.lib)
#target_include_directories(pthread PUBLIC  "${CMAKE_CURRENT_SOURCE_DIR}/pthread/include")
set_property(TARGET pthread APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES ${CMAKE_CURRENT_SOURCE_DIR}/pthread/include)