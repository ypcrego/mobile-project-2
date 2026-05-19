# Flutter E-Commerce Prototype (mobile_project_2)

## About the Project
This project is an e-commerce prototype application built with Flutter. It was developed to demonstrate core mobile development concepts including user authentication, external API consumption, and global state management.

**Core Features:**
- **Login & Authentication:** A simulated login flow with basic credentials validation (`admin` / `12345678`) and session persistence using `shared_preferences`.
- **Product Grid:** A dynamic listing of products fetched from an external source, presented in an elegant grid layout.
- **API Integration:** Asynchronous consumption of the [Fake Store API](https://fakestoreapi.com/) to populate the product catalog.
- **Cart State Management:** A responsive shopping cart that allows users to add products, adjust quantities, and dynamically calculates the total price, built using the `provider` package.

## Tech Stack & Architecture
- **Framework:** Flutter / Dart ^3.11.1
- **State Management:** `provider`
- **Networking:** `http`
- **Local Storage:** `shared_preferences`


## How to Run

### Prerequisites
- [Flutter SDK](https://docs.flutter.dev/get-started/install) installed and configured on your machine.
- An IDE with Flutter support (such as VS Code, Android Studio, or IntelliJ).
- An active device emulator or a physical device connected via USB/Wi-Fi.

### Step-by-Step Instructions

1. **Clone or Open the Project:**
   Navigate to the project root directory in your terminal:
   ```bash
   cd path/to/mobile_project_2
   ```

2. **Install Dependencies:**
   Run the following command to download and install all necessary packages defined in `pubspec.yaml`:
   ```bash
   flutter pub get
   ```

3. **Run the Application:**
   Start the application on your active emulator or connected device:
   ```bash
   flutter run
   ```
