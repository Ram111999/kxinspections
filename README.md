# KxInspections Student App — Contesting Charges Technical Assessment

## Overview
This Flutter application is built as part of a technical assessment for the KxInspections Student App. The goal of the project is to demonstrate a practical implementation of core Flutter concepts while addressing the assignment requirements.

## Assignment Objective
The objective of this assignment is to build a Flutter application that supports features outlined in the provided technical assessment  These include:

- A **Maintenance Hub** to display maintenance tasks, charges, and bookings.
- A **Contest Charge** screen to allow users to contest a raised charge.
- A **View Contest charge** Screen shows user to view the charge received
- A Integration with mock data and repository patterns for modularity.


## Flutter Environment</summary>
Flutter 3.41.6 • channel stable • https://github.com/flutter/flutter.git
Framework • revision db50e20168 (4 months ago) • 2026-03-25 16:21:00 -0700
Engine • hash 5cdd32777948fa7a648fac915f8da7120ac7e97a (revision 425cfb54d0) (3 months ago) •
2026-03-25 20:14:42.000Z
Tools • Dart 3.11.4 • DevTools 2.54.2

Java version OpenJDK Runtime Environment.
openjdk 17.0.18 2026-01-20 LTS
OpenJDK Runtime Environment Microsoft-13106358 (build 17.0.18+8-LTS)
OpenJDK 64-Bit Server VM Microsoft-13106358 (build 17.0.18+8-LTS, mixed mode, sharing)

Running test on Android Emulator terminal command:
flutter test integration_test/maintenance_charge_flow_test.dart -d emulator-5554


## Features
The implemented features in this project include:

- **Maintenance Hub Screen** with tabs for open tasks and charge history.
- **Charge Screen** to view the details of an outstanding charge.
- **Contest Charge Screen** to provide a reason for contesting a charge.
- Mock data integration using a repository pattern for tasks, charges, inventory, and inspections.
- Navigation using `go_router`.
- State management with `provider`.

## Videos
- [▶ Watch Testing Demo](demo/testing_demo.mp4) 
- [▶ Watch Full Working Demo](demo/full-working-demo.mp4) 

## Architecture
The app follows a clean architecture approach emphasizing **separation of concerns** and modular design:

- **Core Module**: Contains shared utilities, themes, constants, and reactive state management.
- **Features Module**: Features like Maintenance Hub are organized into subfolders to separate business logic, widgets, and data.
- **Repository Pattern**: Abstracts the data source to allow easy swapping between mock and live implementations.

## Folder Structure
```
.
├── android/
├── assets/
│   ├── json/
│      ├── bookings.json
│      ├── charges.json
│      ├── inspections.json
├── ios/
├── lib/
│   ├── app/
│   │   ├── router/
│   │   │   ├── app_router.dart
│   │   │   ├── routes.dart
│   │   ├── app.dart
│   │   ├── main.dart
│   ├── core/
│   │   ├── constants/
│   │   ├── network/
│   │   ├── theme/
│   │   ├── utils/
│   │   ├── widgets/
│   ├── features/
│   │   ├── maintenance/
│   │   │   ├── bottom_nav/
│   │   │   │   ├── provider/
│   │   │   │   │   ├── maintenance_provider.dart
│   │   │   │   ├── screens/
│   │   │   │   │   ├── bottom_nav_screen.dart
│   │   │   │   ├── widgets/
│   │   │   │   │   ├── booking_selector.dart
│   │   │   │   │   ├── charge_banner.dart
│   │   │   │   │   ├── maintenance_bottom_nav_bar.dart
│   │   │   │   ├── repository/
│   │   │   │   │   ├── dio_maintenance_repository.dart
│   │   │   │   ├── datasource/
│   │   │   │   │   ├── maintenance_mock_api.dart
│   │   │   ├── charge/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── charge_screen.dart
│   │   │   ├── contest_charge/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── contest_charge_screen.dart
│   │   │   ├── inspection/
│   │   │   │   ├── screens/
│   │   │   │   │   ├── inspection_screen.dart
│   ├── pubspec.yaml
│   ├── test/
├── test/
├── pubspec.lock
```

## Tech Stack
- **Language**: Dart
- **Framework**: Flutter
- **State Management**: Provider
- **Navigation**: go_router
- **Data Persistence**: Mock API with potential for future expansion to local storage (Hive/Shared Preferences).

## Packages Used
From `pubspec.yaml`:

- `provider` for state management.
- `go_router` for navigation.
- `Dio` for mock API handling.
- `freezed` and `json_annotation` for immutable models and serialization.
- `intl` for localization and date formatting.

## State Management
The app uses **Provider** for state management. The `MaintenanceProvider` centralizes the state for the Maintenance Hub, including:

- Booking selection.
- Tasks, charges, and inventory data.
- Error handling and loading states.

The `context.watch` pattern is used to rebuild widgets reactively when state changes.

## Navigation
Navigation is implemented using **go_router**. Routes are defined in `routes.dart` and wired into the `AppRouter`. Parameterized routes are used for screens like `ChargeScreen` and `ContestChargeScreen` to pass the charge/task ID.

## Data Flow
Data flows as follows:

1. **Mock API (MaintenanceMockApi)** provides static JSON data.
2. **DioMaintenanceRepository** fetches and maps the mock data into models.
3. **MaintenanceProvider** consumes the repository and exposes reactive state to the UI.
4. UI widgets observe the provider's state using `context.watch`.

## Screens
The app includes the following screens:

- **Maintenance Hub Screen** (`bottom_nav_screen.dart`): Central hub with tabs for open tasks and charge history.
- **Charge Screen** (`charge_screen.dart`): Displays charge details, including item, type, notes, and images.
- **Contest Charge Screen** (`contest_charge_screen.dart`): Allows the user to provide a reason for contesting a charge.

## Assignment Coverage
Here is the requirement coverage based on the implementation:

| Requirement | Status | Notes |
|-------------|--------|-------|
| Maintenance Hub | ✅ | Fully implemented. |
| Contest Charge | ✅ | Implemented with reason editing and submission functionality. |
| Charge Screen | ✅ | View outstanding charge details. |
| Mock Data Integration | ✅ | JSON fixtures used for tasks, charges, and inventory. |
| Navigation | ✅ | Routes defined and implemented with `go_router`. |
| State Management | ✅ | Provider used effectively for reactive state. |
| Responsive Support | ⚠️ | Basic support via `Responsive` utils but not fully exercised. |
| Unit Tests | ⚠️ | Minimal provider tests; or integration tests. |
| Persistence | ❌ | No implementation for persistent storage (e.g., Hive or Shared Preferences). |
| CI Configuration | ❌ | Not included. |

## Design Decisions

### Architecture
The architecture prioritizes **separation of concerns** by:

- Isolating each feature (e.g., Maintenance Hub) into its own subfolder with subcomponents for screens, providers, and models.
- Using a repository pattern (`DioMaintenanceRepository`) to decouple the UI from the data source.

### Provider Usage
The `MaintenanceProvider` manages all feature-specific state, including:

- Reactive updates to bookings, charges, tasks, and inventory.
- Error handling for mock API failures.

This approach ensures the UI is decoupled from data-fetching logic.

### Repository Pattern
A repository abstraction (`MaintenanceRepository`) is used to allow easy replacement of the mock API with a live API in the future. This also enforces separation between business logic and data-fetching mechanisms.

### JSON Fixture Usage
Static JSON files (`assets/json/`) are used to simulate backend responses. This approach is lightweight and sufficient for this assignment, although it does not exercise live API integration.

### Persistence Strategy
No persistence exists beyond mock data, as the assignment scope did not explicitly require local storage. However, a future improvement could use **Hive** for offline caching.

## Trade-offs

- **Mock API Over Live Integration**: The decision to use static JSON fixtures simplifies the implementation but does not demonstrate live API handling, can improve a lot in this area on live data.
- **Minimal Testing**: While `provider` state changes are tested, and integration tests,.

## Future Improvements

- Implement **persistent storage** (e.g., Hive or Shared Preferences) for cached data.
- Support **responsive layouts** more comprehensively for tablet and web platforms.
- Integrate a **live API backend** for real-world data flow.

## Known Limitations

- **No Persistent Storage**: The app does not store any data locally.
- **Minimal Testing**: Test coverage is limited to provider state.
- **Static JSON Fixtures**: This approach is suitable for the assignment but not scalable for production.

## AI Usage
Modern AI tools (e.g., Cursor, Continue, ChatGPT) were used for:

- **Documentation generation** (this README.md file).
- **Code review** suggestions and optimizations.

However, all implementation decisions and final code integration were performed and validated by the developer to ensure the submission meets the expected quality standards.