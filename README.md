# Stroll Dating App

This repository contains the codebase for the **Stroll Dating App**, developed as part of an assessment task. The app follows the **Clean Architecture** design pattern and uses **Provider** for state management to ensure scalability, modularity, and ease of testing.

## Project Overview

Stroll is a Flutter-based mobile application designed to facilitate seamless and engaging interactions between users in a dating context. The app is structured to prioritize maintainability, separation of concerns, and responsiveness.

## Key Features
- Clean and intuitive user interface.
- Modular design using Clean Architecture principles.
- Robust state management powered by **Provider**.
- Scalable project structure for future enhancements.

## Project Structure
The app's directory structure is organized to align with Clean Architecture:

### Core
Contains shared utilities, constants, and configurations used throughout the app.

### Data
Handles all data-related operations, including:
- Remote data sources (e.g., API calls).
- Local data sources (e.g., shared preferences or SQLite).
- Repository implementations that mediate between the domain and data layers.

### Domains
Encapsulates the core business logic of the application:
- **Entities**: Define the core models of the app.
- **Use Cases**: Contain the application’s business logic and are reusable across different parts of the app.
- **Repositories**: Interfaces that abstract data operations for the domain layer.

### Presentation
Manages the user interface and interactions:
- **Screens**: Each feature has its own set of screens organized by functionality (e.g., `auth` for authentication-related screens).
- **Widgets**: Reusable UI components.
- **Providers**: Handles state management and interaction with the domain layer.

## Technologies Used
- **Flutter**: For cross-platform mobile development.
- **Provider**: For efficient and lightweight state management.
- **Dart**: The programming language for Flutter.

## Setup and Installation
To get started with this project:

1. Clone the repository:
   ```bash
   git clone https://github.com/dacoolguy1/stroll_dating.git
   ```

2. Navigate to the project directory:
   ```bash
   cd stroll_dating
   ```

3. Install dependencies:
   ```bash
   flutter pub get
   ```

4. Run the application:
   ```bash
   flutter run
   ```

## Development Practices
- **Clean Architecture**: Ensures separation of concerns and easier testing.
- **State Management**: Used Provider to decouple UI and business logic.
- **Feature-Based Organization**: Facilitates scalability and modularity.

## References
If this is your first Flutter project, here are some helpful resources:
- [Lab: Write your first Flutter app](https://docs.flutter.dev/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://docs.flutter.dev/cookbook)
- [Flutter Documentation](https://docs.flutter.dev/): Comprehensive guides and references.

## Conclusion
This project demonstrates a robust approach to Flutter app development by leveraging Clean Architecture and Provider for a maintainable and scalable codebase. The Stroll Dating App is designed to be a strong foundation for future enhancements and production readiness.

