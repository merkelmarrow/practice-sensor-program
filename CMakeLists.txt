cmake_minimum_required(VERSION 3.16)

project(SensorProject VERSION 0.1 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.5 REQUIRED COMPONENTS Quick Sensors Svg Xml)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(appSensorProject
    main.cpp
)

qt_add_qml_module(appSensorProject
    URI SensorProject
    VERSION 1.0
    QML_FILES
        Main.qml
    RESOURCES
        images/Bluebubble.svg
        RESOURCES android/AndroidManifest.xml android/build.gradle android/res/values/libs.xml android/res/xml/qtprovider_paths.xml android/gradle/wrapper/gradle-wrapper.jar android/gradle/wrapper/gradle-wrapper.properties android/gradle.properties android/gradlew android/gradlew.bat
)

set_property(TARGET appSensorProject APPEND PROPERTY
    QT_ANDROID_PACKAGE_SOURCE_DIR ${CMAKE_CURRENT_SOURCE_DIR}/android
)

qt_finalize_executable(appSensorProject)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appSensorProject PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appSensorProject
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE FALSE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appSensorProject
    PRIVATE Qt6::Quick Qt6::Sensors Qt6::Svg Qt6::Xml
)

include(GNUInstallDirs)
install(TARGETS appSensorProject
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
