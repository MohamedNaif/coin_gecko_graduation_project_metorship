# 🪙 Coin Gecko Graduation Project

![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)
![Dart](https://img.shields.io/badge/dart-%230175C2.svg?style=for-the-badge&logo=dart&logoColor=white)
![Firebase](https://img.shields.io/badge/firebase-%23039BE5.svg?style=for-the-badge&logo=firebase)
![Stripe](https://img.shields.io/badge/Stripe-5433FF?style=for-the-badge&logo=stripe&logoColor=white)
![Sentry](https://img.shields.io/badge/Sentry-362D59?style=for-the-badge&logo=sentry&logoColor=white)
![SonarQube](https://img.shields.io/badge/SonarQube-4E9BCD?style=for-the-badge&logo=sonarqube&logoColor=white)

A comprehensive cryptocurrency tracking application built with Flutter, featuring real-time market data, portfolio management, secure authentication, and payment integration.

---

## 🚀 Features

- **Authentication**: Secure login and sign-up using Firebase Auth & Biometric Authentication.
- **Market Data**: Real-time cryptocurrency prices and charts using CoinGecko API.
- **Portfolio Tracking**: Manage your crypto holdings and track performance.
- **Payments**: Integrated Stripe payment gateway for premium features.
- **Localization**: Support for English and Arabic.
- **Theming**: Dark and Light mode support.

---

## 📸 Application Preview

<div align="center">

### 🌊 Splash & Onboarding

<img src="https://github.com/user-attachments/assets/6d94bf45-6012-41e9-8fa0-a9146f579b3b" width="19%" />
<img src="https://github.com/user-attachments/assets/86a4599d-2eee-47cf-a101-dcf8f8638c80" width="19%" />
<img src="https://github.com/user-attachments/assets/39864bc5-644b-4a14-a8f1-4c7c912c2531" width="19%" />
<img src="https://github.com/user-attachments/assets/74dbeb3b-8b2a-4241-afd4-e34f3094d7b6" width="19%" />
<img src="https://github.com/user-attachments/assets/404f638f-7281-4ecb-a830-4cc544b9b116" width="19%" />

### 🏠 Home Dashboard

<img src="https://github.com/user-attachments/assets/af4db798-adaf-4997-abd2-d0d20b06f23a" width="24%" />
<img src="https://github.com/user-attachments/assets/9db954b3-97f0-41c0-8bb5-2cc345782a06" width="24%" />
<img src="https://github.com/user-attachments/assets/82c55497-1a19-4395-9c15-853c5549374d" width="24%" />
<img src="https://github.com/user-attachments/assets/20d0fc98-09be-4b17-91ce-babce784e6da" width="24%" />

### 📈 Market Analysis

<img src="https://github.com/user-attachments/assets/85fae7f3-a69e-41a1-a5ac-bdd2e80c557f" width="19%" />
<img src="https://github.com/user-attachments/assets/175476ba-70e8-4b89-aa26-476a0e839ec4" width="19%" />
<img src="https://github.com/user-attachments/assets/7879f304-bdfa-4d69-863c-8d3377abc623" width="19%" />
<img src="https://github.com/user-attachments/assets/56491ee6-b859-4f69-92f8-f1fe9373d66b" width="19%" />
<img src="https://github.com/user-attachments/assets/762b01d8-b822-4431-b551-352b15f3c476" width="19%" />

### 💼 Portfolio Management

<img src="https://github.com/user-attachments/assets/2af8e803-8f78-4980-a6cb-0d623a357332" width="30%" />
<img src="https://github.com/user-attachments/assets/d332a8ec-1b8b-4871-a989-f6876ded4987" width="30%" />

### ⚙️ Settings & Profile

<img src="https://github.com/user-attachments/assets/d1134472-7c75-4139-b30b-82e45db92514" width="30%" />
<img src="https://github.com/user-attachments/assets/27cdd329-56d9-4d31-bb8a-9ac3f99520f8" width="30%" />
<img src="https://github.com/user-attachments/assets/19826813-9e82-4ce6-9576-8f6941c7021d" width="30%" />

</div>

---

## 🛠️ Tech Stack

- **Framework**: Flutter
- **Language**: Dart
- **State Management**: Flutter Bloc
- **Networking**: Dio, Retrofit
- **Dependency Injection**: GetIt, Injectable
- **Backend / Services**: Firebase (Auth, Firestore)
- **Payment**: Stripe
- **Monitoring**: Sentry
- **Code Quality**: SonarQube
- **CI/CD**: Fastlane

---

## 🏁 Getting Started

Follow these steps to set up the project locally.

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) (3.5.0 - 4.0.0)
- [Dart SDK](https://dart.dev/get-dart)
- Android Studio / VS Code
- SonarQube Scanner (optional, for code analysis)

### Installation

1.  **Clone the repository**

    ```bash
    git clone https://github.com/yourusername/coin_gecko_project.git
    cd coin_gecko_graduation_project_metorship
    ```

2.  **Install dependencies**

    ```bash
    flutter pub get
    ```

3.  **Setup Environment Variables**
    Create a `.env` file in the root directory and add the following keys:

    ```env
    STRIPE_PUBLISH_KEY=your_stripe_publishable_key
    # Add other required keys here
    ```

4.  **Code Generation**
    Run build runner to generate necessary code for JSON serialization, freezed, and injection:
    ```bash
    dart run build_runner build --delete-conflicting-outputs
    ```

### Running the App

This project has two entry points for different environments:

- **Development**:

  ```bash
  flutter run -t lib/main_development.dart
  ```

- **Production**:
  ```bash
  flutter run -t lib/main_production.dart
  ```

---

## 💳 Payment Integration (Stripe)

This project uses **Stripe** for handling payments.

### Configuration

1.  Obtain your **Publishable Key** from the [Stripe Dashboard](https://dashboard.stripe.com/).
2.  Add the key to your `.env` file:
    ```env
    STRIPE_PUBLISH_KEY=pk_test_...
    ```
3.  The app initializes Stripe in `lib/main_development.dart` using:
    ```dart
    Stripe.publishableKey = dotenv.env["STRIPE_PUBLISH_KEY"]!;
    await Stripe.instance.applySettings();
    ```

---

## 🔍 Code Quality (SonarQube)

We use **SonarQube** to ensure code quality and maintainability.

### Setup & Analysis

1.  Ensure you have a SonarQube server running locally (default: `http://localhost:8888`) or access to a remote instance.
2.  The configuration is defined in `sonar-project.properties`.
3.  Run the analysis using `sonar-scanner`:

    ```bash
    # Linux / Mac
    export SONAR_TOKEN=your_token
    sonar-scanner

    # Windows (PowerShell)
    $env:SONAR_TOKEN="your_token"
    sonar-scanner
    ```

**Configuration (`sonar-project.properties`)**:

- **Project Key**: `Coins--gecko`
- **Sources**: `lib/`
- **Tests**: `test/`
- **Exclusions**: Generated files (`.g.dart`, `.mocks.dart`)

---

## 🚨 Monitoring (Sentry)

**Sentry** is integrated for real-time error tracking and performance monitoring in the **production** environment.

### Integration Details

- Sentry is initialized in `lib/main_production.dart`.
- It captures unhandled exceptions and performance traces.
- DSN is currently configured in the code. For better security, consider moving it to environment variables or build configurations.

```dart
await SentryFlutter.init(
  (options) {
    options.dsn = 'YOUR_DSN_HERE';
    options.tracesSampleRate = 1.0;
  },
  appRunner: () => runApp(SentryWidget(child: MyApp())),
);
```

---

## 🚀 CI/CD (Fastlane)

Automated deployment is handled using **Fastlane**.

### Android

The setup is located in `android/fastlane`.

**Available Lanes:**

- `firebase_distribution`: Builds the app (development flavor) and uploads it to **Firebase App Distribution**.

**To run deployment:**

1.  Navigate to the android directory:
    ```bash
    cd android
    ```
2.  Set the required environment variables:

    - `FIREBASE_APP_ID`: Your Firebase App ID.
    - `FIREBASE_CLI_TOKEN`: Your Firebase CLI Token.

3.  Run the lane:
    ```bash
    fastlane android firebase_distribution
    ```

_Note: Ensure you have your Google credentials and `firebase_app_id` configured in `Fastfile` or environment variables._

---

## 📂 Project Structure

```
lib/
├── config/             # App configuration (routes, themes, localization)
├── core/               # Core utilities, DI, API services, shared widgets
├── features/           # Feature-based modules (auth, portfolio, settings, etc.)
│   ├── auth/
│   ├── portfolio/
│   └── ...
├── main_development.dart
└── main_production.dart
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.
