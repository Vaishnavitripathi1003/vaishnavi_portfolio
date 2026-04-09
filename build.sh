#!/usr/bin/env bash

# Clone Flutter (specific stable version)
git clone https://github.com/flutter/flutter.git --depth 1 -b stable

# Set path
export PATH="$PATH:`pwd`/flutter/bin"

# Verify Flutter (IMPORTANT)
flutter doctor

# Enable web
flutter config --enable-web

# Clean old builds
flutter clean

# Get dependencies
flutter pub get

# Build web
flutter build web
