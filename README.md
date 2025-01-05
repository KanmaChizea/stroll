# Stroll

## Introduction

### App Overview
//TODO: Brief description of what the app does

### Features
//TODO: List main features of the app

### Technologies Used
- Flutter: A cross-platform framework for building mobile, web, and desktop applications.
- Get it: A reactive and scalable dependency injection library for Flutter.
- Bloc: A state management library for Flutter that makes it easy to manage application state.

## Getting Started

### Prerequisites
- Flutter SDK
- Dart SDK
- Android Studio
- Xcode

### Installation Instructions

- Clone the Repository
```
git clone https://www.github.com/.git
```

- Navigate to the project directory:
```
cd stroll
```

- Install dependencies
```
flutter pub get
cd ios && pod install
```

- Run the App: Run the app on a simulator or physical device.
```
flutter run
```

## Project Structure

### Directory Layout

```
stroll/
├── lib/
│   ├── main.dart
│   ├── assets/
│   ├── core/
│   ├── screens/
│   ├── widgets/
│   ├── repository/
│   ├── models/
│   ├── theme/
│   └── utils/
├── test/
└── README.md
```

- lib/main.dart: Entry point of the application.
- lib/screens/: Contains all screen widgets.
- lib/widgets/: Contains reusable widgets.
- lib/repository/: Contains repository that communicates with external  services.
- lib/models/: Contains data models.
- lib/utils/: Contains utility classes and functions.

### Code Organization

- App Architecture: This app follows the MVVM.
- State Management: The app uses Bloc.
- Dependency Injection: Dependency injection is handled using Get it.

## Modules and Components

### Screens
- HomeScreen: Displays the home page.
- DetailScreen: Displays details of a specific item.

### Widgets
- SvgIcon: A reusable widget for rendering svg icons.
- StrokedText: A widget for creating a stroked text;
- AppError: A widget for rendering error messages on UI elements


### Repositories
- BonfireRepository: Handles API calls and data fetching for the bonfire feature.

### Utilities
- DateFormatter: Provides date formatting utilities.
- Scaling: Provides scaling functions for adaptive and responsive rendering
- Async Value: Provides asynchronous rendering


## Error Handling
//TODO:Describe how API errors are handled.


## Testing

### Testing Strategy:
The app uses unit tests and widget tests.

### Test Setup

- Install the Flutter test dependencies:
```
flutter pub add test

```

### Running Tests

- Run all tests
```
flutter test
```


