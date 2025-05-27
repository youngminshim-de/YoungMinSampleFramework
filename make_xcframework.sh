#!/bin/bash

FRAMEWORK_NAME="YoungMinSampleFramework"

# archive path
DEVICE_ARCHIVE_PATH="archives/${FRAMEWORK_NAME}-iOS.xcarchive"
SIMULATOR_ARCHIVE_PATH="archives/${FRAMEWORK_NAME}-Simulator.xcarchive"

# xcframework path
XCFRAMEWORK_PATH="${FRAMEWORK_NAME}.xcframework"

# 이전 결과물 삭제
rm -rf "$DEVICE_ARCHIVE_PATH" "$SIMULATOR_ARCHIVE_PATH" "$XCFRAMEWORK_PATH"

xcodebuild archive \
    -scheme "$FRAMEWORK_NAME" \
    -destination "generic/platform=iOS" \
    -archivePath "$DEVICE_ARCHIVE_PATH" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES
    
xcodebuild archive \
    -scheme "$FRAMEWORK_NAME" \
    -destination "generic/platform=iOS Simulator" \
    -archivePath "$SIMULATOR_ARCHIVE_PATH" \
    SKIP_INSTALL=NO \
    BUILD_LIBRARY_FOR_DISTRIBUTION=YES

echo "🛠 Creating XCFramework..."
xcodebuild -create-xcframework \
    -framework "$DEVICE_ARCHIVE_PATH/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -framework "$SIMULATOR_ARCHIVE_PATH/Products/Library/Frameworks/${FRAMEWORK_NAME}.framework" \
    -output "$XCFRAMEWORK_PATH"

echo "✅ XCFramework created at: $XCFRAMEWORK_PATH"
