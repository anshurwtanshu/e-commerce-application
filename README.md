# 🛒 Flutter E-Commerce App

**A modern e-commerce application built with Flutter and Dart, featuring Firebase authentication, GetX state management, and cloud-based profile image uploads.**

This project demonstrates the development of a Flutter application using a structured architecture, reusable UI components, reactive state management, and Firebase services.

---

## 📌 About the Project

The Flutter E-Commerce App is a learning and development project focused on building a scalable mobile application. It brings together authentication, user profile management, form validation, cloud storage integration, and state management in one application.

The project follows a repository-based approach to separate application logic from data operations, helping keep the code organized and maintainable.

## ✨ Key Features

- **Authentication** — User registration and login using Firebase Authentication.
- **Email Verification** — Supports email verification workflows.
- **Profile Management** — Manage user information and profile details.
- **Profile Image Upload** — Select and upload profile pictures using Image Picker and Cloudinary.
- **Reactive State Management** — Manage application state using GetX.
- **Navigation** — Handle screen transitions and dependency injection with GetX.
- **Form Validation** — Validate user input before processing forms.
- **Account Management** — Includes account deletion and re-authentication workflows.
- **Cloud Database** — Store and retrieve user profile information using Cloud Firestore.
- **Reusable UI Components** — Organize common widgets and styling for easier maintenance.

## 🧰 Technology Stack

| Technology | Usage |
|---|---|
| Flutter | Cross-platform application development |
| Dart | Application programming language |
| GetX | State management, navigation, and dependency injection |
| Firebase Authentication | User registration and authentication |
| Cloud Firestore | User profile data |
| Cloudinary | Profile image hosting |
| Image Picker | Selecting images from the device |
| Dio / HTTP | Network requests, where implemented |

## 🏗️ Architecture

The application separates responsibilities into screens, controllers, models, and repositories.

```text
User Interface
      │
      ▼
GetX Controllers
      │
      ▼
Repositories
      │
      ├── Firebase Authentication
      ├── Cloud Firestore
      └── Cloudinary
```

**Architecture overview:**

- **Screens and widgets:** Display the user interface and collect input.
- **Controllers:** Manage application state, validation, and user actions.
- **Models:** Represent user data using Dart classes.
- **Repositories:** Handle communication with backend services.
- **Firebase and Cloudinary:** Provide authentication, database, and image-hosting services.

## 📁 Project Structure

The following is an illustrative structure. Update it to reflect the actual folders in your repository.

```text
lib/
├── common/
│   ├── style/
│   └── widgets/
├── data/
│   ├── models/
│   └── repositories/
├── features/
│   └── authentication/
│       ├── controllers/
│       ├── models/
│       └── screens/
├── utils/
│   ├── constants/
│   ├── helpers/
│   └── validators/
├── firebase_options.dart
└── main.dart
```

## ⚙️ Getting Started

Follow these steps to run the project locally.

### Prerequisites

- Flutter SDK and Dart SDK
- Android Studio or Visual Studio Code
- An Android emulator, iOS simulator, or compatible device
- A Firebase project
- A Cloudinary account for profile image uploads

### 1. Clone the repository

```bash
git clone YOUR_REPOSITORY_URL
cd YOUR_PROJECT_DIRECTORY
```

Replace the placeholders with your GitHub repository URL and project directory.

### 2. Install dependencies

```bash
flutter pub get
```

### 3. Configure Firebase

1. Create a project in the [Firebase Console](https://console.firebase.google.com/).
2. Register your application with Firebase.
3. Enable the authentication providers required by the project.
4. Set up Cloud Firestore if it is used by your application.
5. Configure Firebase for the platforms you intend to run.

If you use FlutterFire CLI:

```bash
dart pub global activate flutterfire_cli
flutterfire configure
```

### 4. Configure Cloudinary

Configure the image upload functionality using your Cloudinary account and the upload method implemented in your project.

**Security:** Never commit private API secrets or service-account credentials to GitHub. Use a secure backend or an appropriately secured upload workflow for sensitive operations.

### 5. Run the application

```bash
flutter run
```

## 🔄 How It Works

1. A user registers or logs in through the authentication interface.
2. The controller validates input and coordinates the authentication workflow.
3. Firebase Authentication handles supported authentication operations.
4. Repository classes retrieve or update user profile information.
5. Cloud Firestore stores user profile data.
6. Cloudinary handles profile image uploads.
7. GetX reactive state updates the interface when relevant data changes.

## 🎯 Learning Outcomes

This project provides practical experience with:

- Flutter UI development and reusable widgets
- Dart classes, asynchronous programming, and error handling
- GetX state management and dependency injection
- Firebase Authentication and Cloud Firestore
- Repository and model-based code organization
- Image selection and cloud image uploads
- Form validation and user account workflows
- Integration of third-party services

## 🚀 Roadmap

Potential improvements for future versions:

- [ ] REST API integration for product data
- [ ] Product listing and product detail screens
- [ ] Search, sorting, and filtering
- [ ] Shopping cart and checkout
- [ ] Order history and order management
- [ ] Payment gateway integration
- [ ] Unit and widget testing
- [ ] Improved loading, error, and empty states

## 🔐 Security Notes

- Keep private credentials out of source control.
- Configure Firebase Security Rules before deploying.
- Protect Cloudinary image deletion and other privileged operations using a secure backend.
- Validate user input and handle authentication errors appropriately.


