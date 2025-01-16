# Travel Companion App

This is a Flutter-based Travel Companion App that helps users explore places, add personal markers on the map, and save travel memories with photos and descriptions.

## Instructions to Run the App

### 1. Prerequisites

   * Flutter SDK
   * Android Studio

### 2. Clone the Repository
```
git clone <repository-url>
```

### 3. Install Dependencies
```flutter pub get``` or go to `pubspec.yaml` and on the top right press `pub get`

![image](https://github.com/user-attachments/assets/eaafe0f1-5f8e-49d2-a8d5-a0126eaf2303)

### 4. Run the application
```flutter run``` or press the run button

![image](https://github.com/user-attachments/assets/5c4a4241-adb7-43ba-ac12-4f22b66c0c4f)


## State Management Approach

### Provider

This app uses the Provider package for state management. Provider is lightweight and easy to use, making it a great choice for managing application state. Below is an overview of how it is used:

1. Authentication State:

   * The AuthProvider manages user authentication using Firebase Authentication.

   * Methods like login, signup, and logout are implemented to handle authentication logic.

2. Places Data:

   * AuthProvider also handles fetching and adding places to Firestore.

   * A StreamBuilder in the HomeScreen listens to real-time updates from Firestore and displays places added by the user. (Display Places Not Implemented)

3. Global State Management:

   * The MultiProvider setup in main.dart ensures that authentication and other state are accessible throughout the app.
  
## Features

1. Login and Signup:

   * Users can log in or create an account using email and password.

2. Google Maps Integration:

   * Displays the user's current location on a map. (Not implemented)

   * Allows users to add custom markers with titles and descriptions. (Not implemented)

   * Saves markers in Firestore and retrieves them on app launch. (Not implemented)

