---
# title: Bookshelf Project
### description: A Flutter project for managing book collections or an e-library using BLoC and Feature-First Clean Architecture.
### tags: [flutter, bloc, clean-architecture, bookshelf, ffca]
---

# 📚 Bookshelf Project

A simple Flutter project to manage a book collection / e-library.

## 🚀 Getting Started

This project uses the **BLoC** pattern and follows the **Feature-First Clean Architecture (FFCA)**.

### ✅ Prerequisites

- Flutter SDK
- Android Studio or VS Code
- Device or emulator to run the app

### 📦 Setup Instructions

1. **Clone the project:**
   ```bash
   git clone https://github.com/your-repo/bookshelf_project.git
   cd bookshelf_project

2. **Install dependencies**
    ```bash
   flutter pub get

3. **Generate code (Hive adapters, models, etc):**
    ```bash
   flutter pub run build_runner build --delete-conflicting-outputs

4. **Run the app**
    ```bash
   flutter run