#!/bin/bash

BUILD_DIRECTORY="Build"

function archive_project() {
  project_name=$1
  framework_name=$2

  # Archive iOS project.
  xcodebuild archive\
   -project "../$project_name.xcodeproj"\
   -scheme "$framework_name"\
   -configuration "Release"\
   -destination "generic/platform=iOS"\
   -archivePath "$framework_name.framework-iphoneos.xcarchive"\
   SKIP_INSTALL=NO\
   BUILD_LIBRARY_FOR_DISTRIBUTION=YES

  # Archive iOS Simulator project.
  xcodebuild archive\
     -project "../$project_name.xcodeproj"\
     -scheme "$framework_name"\
     -configuration "Simulator Release"\
     -destination "generic/platform=iOS Simulator"\
     -archivePath "$framework_name.framework-iphonesimulator.xcarchive"\
     SKIP_INSTALL=NO\
     BUILD_LIBRARY_FOR_DISTRIBUTION=YES
}

function create_xcframework() {
  project_name=$1
  framework_name=$2

  # Archive Xcode project.
  archive_project $project_name $framework_name

  # Create XCFramework from the archived project.
  xcodebuild -create-xcframework\
    -framework "$framework_name.framework-iphoneos.xcarchive/Products/Library/Frameworks/$framework_name.framework"\
    -framework "$framework_name.framework-iphonesimulator.xcarchive/Products/Library/Frameworks/$framework_name.framework"\
    -output "$framework_name.xcframework"

    # Compress the XCFramework.
    zip -r -X "$framework_name.xcframework.zip" "$framework_name.xcframework/"

    # Save the SHA-256 checksum
    shasum -a 256 "$framework_name.xcframework.zip" >> checksum
}

function cleanup() {
  rm -r *.xcframework
  rm -r *.xcarchive
}

# Uncomment this when running for the first time (or to update to latest versions of dependency xcframeworks) and drop these frameworks to project from Carthage/iOS (plus GoogleMaps.bundle from GoogleMaps.framework/Resources) with 'Copy items' option unchecked.
# carthage update --platform iOS --use-xcframeworks

# Create Build directory if not existing.
if [ ! -d "$BUILD_DIRECTORY" ]; then
  mkdir $BUILD_DIRECTORY
fi

cd $BUILD_DIRECTORY

create_xcframework "GoogleMapsUtils" "GoogleMapsUtils"

cleanup

echo $'\n** XCFRAMEWORK CREATION FINISHED **\n'
