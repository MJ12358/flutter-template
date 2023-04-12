# Flutter Template

A Flutter skeleton using Clean Architecture, the Bloc state management solution and Sembast.

## Installation

```bash
npx degit mj12358/flutter-template myapp
```

## Getting Started

This project is a starting point for a Flutter application that follows [clean architecture](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html),
[bloc state management](https://bloclibrary.dev/#/gettingstarted) and uses [sembast](https://pub.dev/packages/sembast) for data storage.

For help getting started with Flutter development, view the
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Assets

The `assets` directory houses images, fonts, and any other files you want to
include with your application.

The `assets/images` directory contains [resolution-aware
images](https://flutter.dev/docs/development/ui/assets-and-images#resolution-aware).

## Localization

This project generates localized messages based on arb files found in
the `l10n` directory.

To support additional languages, please visit the tutorial on
[Internationalizing Flutter
apps](https://flutter.dev/docs/development/accessibility-and-localization/internationalization)

## Changing the App Name

This project includes [change_app_package_name](https://pub.dev/packages/change_app_package_name) and [flutter_app_name](https://pub.dev/packages/flutter_app_name) to aid in changing the app/package name.

First modify `pubspec.yaml` `name` and `flutter_app_name`.

Then run:

```bash
flutter pub run flutter_app_name
flutter pub run change_app_package_name:main com.company.myappname
```

You can then use find an replace to switch any import references from the old name to the new one.

## Changing Launcher Icons

This project includes [flutter_launcher_icons](https://pub.dev/packages/flutter_launcher_icons) to aid in generating the necessary icons.

First determine which icon you want to use. Place it into the `assets` folder and modify the `flutter_launcher_icons.yaml` file to fit your needs.

Then run:

```bash
flutter pub run flutter_launcher_icons:main
```

## Changing the Splash Screen

This project includes [flutter_native_splash](https://pub.dev/packages/flutter_native_splash) to aid in generating the necessary images.

First determine which image you want to use. Place it into the `assets` folder and modify the `flutter_native_splash.yaml` file to fit your needs.

Then run:

```bash
flutter pub run flutter_native_splash:create
```

## Signing Your App

A convenience script is located in the `scripts` folder for generating a new keystore.

Move the generated keystore into `android/app` and create a `android/key.properties` file with the following:

```properties
storePassword=yourSuperSecretPassword
keyPassword=yourSuperSecretPassword
keyAlias=release
storeFile=release_keystore.jks
```
