# Generated by CMake 2.8.12.2

if("${CMAKE_MAJOR_VERSION}.${CMAKE_MINOR_VERSION}" LESS 2.5)
   message(FATAL_ERROR "CMake >= 2.6.0 required")
endif()
cmake_policy(PUSH)
cmake_policy(VERSION 2.6)
#----------------------------------------------------------------
# Generated CMake target import file.
#----------------------------------------------------------------

# Commands may need to know the format version.
set(CMAKE_IMPORT_FILE_VERSION 1)

# Protect against multiple inclusion, which would fail when already imported targets are added once more.
set(_targetsDefined)
set(_targetsNotDefined)
set(_expectedTargets)
foreach(_expectedTarget caffe proto)
  list(APPEND _expectedTargets ${_expectedTarget})
  if(NOT TARGET ${_expectedTarget})
    list(APPEND _targetsNotDefined ${_expectedTarget})
  endif()
  if(TARGET ${_expectedTarget})
    list(APPEND _targetsDefined ${_expectedTarget})
  endif()
endforeach()
if("${_targetsDefined}" STREQUAL "${_expectedTargets}")
  set(CMAKE_IMPORT_FILE_VERSION)
  cmake_policy(POP)
  return()
endif()
if(NOT "${_targetsDefined}" STREQUAL "")
  message(FATAL_ERROR "Some (but not all) targets in this export set were already defined.\nTargets Defined: ${_targetsDefined}\nTargets not yet defined: ${_targetsNotDefined}\n")
endif()
unset(_targetsDefined)
unset(_targetsNotDefined)
unset(_expectedTargets)


# Create imported target caffe
add_library(caffe SHARED IMPORTED)

# Create imported target proto
add_library(proto STATIC IMPORTED)

# Import target "caffe" for configuration "Release"
set_property(TARGET caffe APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(caffe PROPERTIES
  IMPORTED_LINK_INTERFACE_LIBRARIES_RELEASE "proto;proto;/tools/boost/1.58.0/lib/libboost_system.so;/tools/boost/1.58.0/lib/libboost_thread.so;/tools/boost/1.58.0/lib/libboost_filesystem.so;-lpthread;/tools/glog/0.3.4/lib/libglog.so;/tools/gflags/2.1.2/lib/libgflags.a;/tools/protobuf/2.6.1/lib/libprotobuf.so;-lpthread;/usr/lib64/libhdf5_hl.so;/usr/lib64/libhdf5.so;/usr/lib64/liblmdb.so;/usr/lib64/libleveldb.so;/tools/snappy/2015-06-24/lib/libsnappy.so;/usr/local/cuda-6.5/lib64/libcudart.so;/usr/local/cuda-6.5/lib64/libcurand.so;/usr/local/cuda-6.5/lib64/libcublas.so;/tools/cudnn/7.0/lib64/libcudnn.so;opencv_core;opencv_highgui;opencv_imgproc"
  IMPORTED_LOCATION_RELEASE "/home/pmm5983/flownet-release/lib/libcaffe.so"
  IMPORTED_SONAME_RELEASE "libcaffe.so"
  )

# Import target "proto" for configuration "Release"
set_property(TARGET proto APPEND PROPERTY IMPORTED_CONFIGURATIONS RELEASE)
set_target_properties(proto PROPERTIES
  IMPORTED_LINK_INTERFACE_LANGUAGES_RELEASE "CXX"
  IMPORTED_LOCATION_RELEASE "/home/pmm5983/flownet-release/lib/libproto.a"
  )

# This file does not depend on other imported targets which have
# been exported from the same project but in a separate export set.

# Commands beyond this point should not need to know the version.
set(CMAKE_IMPORT_FILE_VERSION)
cmake_policy(POP)
