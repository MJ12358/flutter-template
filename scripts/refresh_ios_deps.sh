#!/bin/bash

# Reusable script for setting up Flutter dependencies on MacOS
# Usage: ./scripts/refresh_ios_deps.sh

set -e  # Exit on error

echo "🧹 Cleaning Flutter project..."
flutter clean

echo "🗑️  Clearing Gradle caches..."
rm -rf ~/.gradle/caches/

echo "📱 Removing iOS Pods and lockfile..."
rm -rf ios/Pods ios/Podfile.lock

echo "📦 Getting Flutter packages..."
flutter pub get

echo "🍎 Setting up iOS dependencies..."
cd ios || {
    echo "❌ Error: ios directory not found"
    exit 1
}

echo "🔄 Updating CocoaPods repo..."
pod repo update

echo "📥 Installing Pods..."
pod install

cd ..

echo "✅ Dependencies setup complete!"