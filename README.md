# Project Title: E-commerce Mobile Application

## Project Overview

The Weaver mobile app revolutionizes online shopping with a user-friendly interface. It offers a login page catering to both buyers and sellers, streamlining access for all users.  With a marketplace feature, users can effortlessly browse through a wide array of items, ensuring they never miss out on exciting finds. For sellers, a dedicated page facilitates the easy listing and management of items, enhancing the selling experience. Through personalized recommendations and real-time notifications, users stay informed about special offers and new arrivals, ensuring a dynamic and engaging shopping experience.

## Key Features

- User Registration: New users can register by providing their details.
- User Login: Registered users can login to access the application.
- Navigation: Users can navigate through different screens like the home screen, login screen, and registration screen.

## Project Architecture

The project follows the standard Flutter project architecture. It is divided into several Dart files, each responsible for a specific feature or screen in the application. The `main.dart` file is the entry point of the application. It contains routes to different screens. Each screen is defined in its own Dart file (like `login_screen.dart`, `register_screen.dart`, etc.). The application also interacts with a backend server for user registration and login.

## External Libraries

- Flutter: Flutter is the primary SDK used for developing the application. It was chosen for its ability to create high-performance, beautiful applications for mobile, web, and desktop from a single codebase.
- Dart: Dart is the programming language used for writing the application. It was chosen for its simplicity, ease of learning, and excellent support for Flutter.

## Local Deployment

To deploy the app locally, follow these steps:

1. Ensure that you have Flutter and Dart installed on your machine. If not, you can download them from [here](https://flutter.dev/docs/get-started/install).

2. Clone the project repository to your local machine using the following command in your terminal:

```bash
git clone https://github.com/b4chh/ecommerce-mobile-application.git
```

3. Navigate to the project directory:

```bash
cd ecommerce-mobile-application
```

4. Run the following command to get all the dependencies:

```bash
flutter pub get
```

5. Start your emulator or connect your mobile device to your machine.

6. Run the app:

```bash
flutter run
```

Please note that you might need to set up a backend server for the application to function correctly. The details for setting up the server are beyond the scope of this README. Please refer to the server's documentation for setup instructions.
