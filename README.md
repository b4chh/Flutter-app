# Project Title: E-commerce Mobile Application

# Project description

The Weaver mobile app revolutionizes online shopping with a user-friendly interface. It offers a login page catering to both buyers and sellers, streamlining access for all users.  With a marketplace feature, users can effortlessly browse through a wide array of items, ensuring they never miss out on exciting finds. For sellers, a dedicated page facilitates the easy listing and management of items, enhancing the selling experience. Through personalized recommendations and real-time notifications, users stay informed about special offers and new arrivals, ensuring a dynamic and engaging shopping experience.

## Deployement status

### APK Android

[![Build my App](https://github.com/b4chh/Flutter-app/actions/workflows/main.yaml/badge.svg)](https://github.com/b4chh/Flutter-app/actions/workflows/main.yaml)

### Web App

[![Netlify Status](https://api.netlify.com/api/v1/badges/d46a0704-ecb5-40da-8a30-235cd9ae3e8b/deploy-status)](https://app.netlify.com/sites/weaverweb/deploys)


## Features

- User registration and authentication.
- Profile management where users can update their profile information.
- GPS location tracking for admin users.
- Admin users can promote other users to admin status.
- Non-admin users can follow the location of admin users.

## Libraries

- `params_lib`: This library is used for managing user parameters and settings.
- `account_lib`: This library is used for handling user account related functionalities.
- `assistance_lib`: This library is used for providing assistance to the users.
- `trend_page_lib`: This library is used for displaying trending content to the users.

## External Libraries Used

- `geolocator`: The `geolocator` library is used to access the GPS functionalities of the mobile device (iOS, Android) and the web.
- `provider`: A wrapper around InheritedWidget to make them easier to use and more reusable.
- `http`: A composable, Future-based library for making HTTP requests.
- `shared_preferences`: Wraps platform-specific persistent storage for simple data (NSUserDefaults on iOS and macOS, SharedPreferences on Android, etc.).
- `intl`: Contains code to deal with internationalized/localized messages, date and number formatting and parsing, bi-directional text, and other internationalization issues.

## Local Deployment

### Prerequisites

- Flutter 3.19.4
- Android Studio (for Android)
- Java JDK (for Android)
- Xcode (for iOS)
- CocoaPods (for iOS)
- Chrome browser (for Web)

### Setup and Installation

1. **Step 1**:
   Clone the repository to your local machine using the following command:

    ```bash
    git clone https://github.com/b4chh/Flutter-app
    cd Flutter-app
    ```
2. **Step 2**:
   Install the required dependencies using the following command:

    ```bash
    flutter pub get
    ```

### Running on Android

1. **step 1**:
   Open an Android emulator or connect a physical device to your machine with USB debugging enabled.

2. **Step 2**:
   Run the application using the following command:

    ```bash
    flutter run
    ```

### Running on iOS

1. **Step 1**:
   Navigate to the iOS folder within your project and run:
    ```bash
    cd ios
    pod install
    ```

2. **Step 2**:
   Open the `Runner.xcworkspace` file in Xcode from the iOS folder.

3. **Step 3**:
   Select your target device or simulator in Xcode.

4. **Step 4**:
   Run the application by pressing the 'Run' button in Xcode or using the following command in the terminal at the project root:
    ```bash
    flutter run
    ```

### Running on Web

1. **Step 1**:
   Ensure that the web version of Flutter is enabled by running:
    ```bash
    flutter config --enable-web
    ```

2. **Step 2**:
   Launch your project in Chrome by running:
    ```bash
    flutter run -d chrome
    ```
