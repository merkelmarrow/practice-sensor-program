# Additional clean files
cmake_minimum_required(VERSION 3.16)

if("${CONFIG}" STREQUAL "" OR "${CONFIG}" STREQUAL "Debug")
  file(REMOVE_RECURSE
  "CMakeFiles\\appSensorProject_autogen.dir\\AutogenUsed.txt"
  "CMakeFiles\\appSensorProject_autogen.dir\\ParseCache.txt"
  "appSensorProject_autogen"
  )
endif()
