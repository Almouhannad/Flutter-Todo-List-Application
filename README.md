# 📱 Flutter Todo List Application

A clean architecture-based Todo List application built with Flutter, implementing BLoC pattern for state management.

## ✨ Features

- ✅ Create, read, update, and delete (CRUD) todo items
- 🏗️ Clean Architecture implementation
- 🔄 BLoC pattern for state management
- 🎯 Dependency Injection

## 🏛️ Architecture

The project follows Clean Architecture principles with the following structure:

```
lib/
├── data/           # Data layer (repositories implementation, data sources)
├── domain/         # Business logic layer
│   ├── entities/   # Business objects
│   ├── repositories/ # Repository interfaces
│   └── usecases/   # Use cases
├── presentation/   # UI layer
│   ├── bloc/       # BLoC components
│   ├── pages/      # Screen implementations
│   └── widgets/    # Reusable widgets
└── injection.dart  # Dependency injection setup
```

## 🚀 Getting Started

### 📋 Prerequisites

- Flutter SDK (latest stable version)
- Dart SDK (latest stable version)
- Android Studio / VS Code with Flutter extensions

### 💻 Installation

1. Clone the repository:
```bash
git clone https://github.com/Almouhannad/Flutter-Todo-List-Application.git
```

2. Navigate to the project directory:
```bash
cd Flutter-Todo-List-Application
```

3. Install dependencies:
```bash
flutter pub get
```

4. Run the app:
```bash
flutter run
```

## 📦 Dependencies

- flutter_bloc: For state management
- get_it: For dependency injection
- equatable: For value equality (Applying DDD entity principles)

## 🤝 Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request
