# Fonts Directory

This directory contains the Roboto font files used in the application.

## Required Font Files

You need to download the following Roboto font files and place them in this directory:

- `Roboto-Light.ttf` (Weight: 300)
- `Roboto-Regular.ttf` (Weight: 400) 
- `Roboto-Medium.ttf` (Weight: 500)
- `Roboto-Bold.ttf` (Weight: 700)

## How to Get Roboto Fonts

### Option 1: Google Fonts (Recommended)
1. Go to [Google Fonts - Roboto](https://fonts.google.com/specimen/Roboto)
2. Click "Download family"
3. Extract the zip file
4. Copy the required .ttf files to this directory

### Option 2: Flutter's Built-in Roboto
Flutter includes Roboto as the default font for Material Design. If you prefer to use Flutter's built-in Roboto, you can remove the fonts section from pubspec.yaml and the fontFamily specification from app_text_styles.dart.

## After Adding Fonts

1. Run `flutter clean`
2. Run `flutter pub get`
3. Restart your app

The fonts will then be available throughout your application using the AppTextStyles class.
