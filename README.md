# salary_securitas

A Flutter application to track Securitas work time and calculate salary details for guards and staff. The app offers local data storage, simple reporting and utilities for developers to seed and export test data.

## Key Highlights
- Track shifts, worked hours and salary calculations per employee.
- Local persistence with a simple SQLite schema and optional Firebase integration.
- Modular UI with reusable components and a clear navigation flow.
- Developer utilities to export/import database fixtures and reproduce test states.

## Features
- Add, edit and remove work entries (date, start/end time, breaks, overtime).
- Automatic calculation of daily and period salaries based on configurable rates.
- Settings view for pay rates, currency and rounding rules.
- Local reports and summaries for pay periods.
- Import/export DB fixtures for testing and demos.

## Demonstration
@TODO: Add screenshots (main view, shift editor, reports, settings) and a short demo video.

## Tech Stack
- Flutter (stable)
- Dart
- SQLite (sqflite) for local persistence
- Optional: Firebase (auth / core) where configured
- Android build with Kotlin / Gradle

## Prerequisites
- Flutter SDK (stable channel)
- Android/iOS toolchains configured for mobile builds
- For desktop testing: enable desktop support (Windows / macOS / Linux)
- Recommended editors: Android Studio or VS Code

## Quick Start

1. Clone the repo
   git clone https://github.com/E-Rossignol/salary_securitas.git

2. Install dependencies
   flutter pub get

3. Run on device
   flutter run -d windows   # or -d android / -d ios / -d macos / -d linux

You can also run the prebuilt APK in the `deliverables/` folder following the instructions in that README.

## Developer utilities (DB)
Helper and DB utilities live in:
- `lib/database/database_service.dart`
- `lib/database/service_db.dart`
- `lib/constants/helper.dart` (fixtures and UI constants)

Utilities:
- import default fixtures — method available in the DB service to populate the database with test data for development.
- export DB to JSON — use the export helper to dump current DB state for debugging or CI.

Use these utilities to create deterministic test data and reproduce common scenarios.

## Project Structure (important files)
- `lib/database/database_service.dart` — DB schema, CRUD and import/export helpers.
- `lib/database/service_db.dart` — high-level database helpers and models.
- `lib/views/` — UI screens (shift list, edit shift, reports, settings).
- `lib/widgets/` — reusable UI components.
- `deliverables/` — prebuilt APKs and installer artifacts.

## What this project demonstrates
- Flutter & Dart proficiency with modular widgets and responsive layouts.
- Local persistence and data modelling for shift and payroll data.
- Developer tooling for seeding and exporting DB fixtures.
- Clean separation of UI and data layers; defensive async handling for DB operations.

## How to validate quickly
- Run the app, add several shifts and open the reports view to verify calculations.
- Use the DB import utility to seed known test data and verify UI displays expected summaries.
- Inspect `lib/database/database_service.dart` for schema, transactions and import/export code.

## Contributing
- Open an issue for bugs or feature requests.
- Fork the repo, create a feature branch and send a PR with a clear description and screenshots.
- Keep formatting consistent (dartfmt) and add unit/UI tests where relevant.

## Contact
Erwan Rossignol — erwan@hotmail.ch  
Project repository: ´https://github.com/E-Rossignol/salary_securitas.git´