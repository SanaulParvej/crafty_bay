# Crafty Bay 🛍️

[![Flutter](https://img.shields.io/badge/Flutter-%2302569B.svg?style=for-the-badge&logo=Flutter&logoColor=white)](https://flutter.dev)
[![Firebase](https://img.shields.io/badge/Firebase-%234285F4.svg?style=for-the-badge&logo=Firebase&logoColor=white)](https://firebase.google.com)
[![License](https://img.shields.io/badge/license-MIT-blue.svg?style=for-the-badge)](LICENSE)
[![LinkedIn](https://img.shields.io/badge/LinkedIn-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white)](https://linkedin.com/in/sanaul-parvej)

A modern, feature-rich e-commerce mobile application built with Flutter and Firebase, designed to provide a seamless shopping experience.

## 🌟 Features

### 🛒 Core Functionality
- **Product Catalog**: Browse through a wide range of products organized by categories
- **Product Search**: Find products quickly with our powerful search functionality
- **Shopping Cart**: Add, remove, and manage items in your cart
- **Wishlist**: Save favorite products for later purchase
- **User Authentication**: Secure sign-up, login, and profile management

### 🎨 User Experience
- **Beautiful UI/UX**: Modern glassmorphism design with smooth animations
- **Responsive Design**: Optimized for all device sizes
- **Intuitive Navigation**: Easy-to-use bottom navigation and category browsing
- **Product Details**: Comprehensive product information with images and pricing

### 🔧 Technical Features
- **RESTful API Integration**: Seamless communication with backend services
- **Firebase Integration**: Authentication, crash reporting, and analytics
- **State Management**: Efficient state management using GetX
- **Responsive Images**: Optimized image loading and caching

## 📸 Screenshots

| Home Screen | Product Details | Cart | Categories |
|-------------|-----------------|------|------------|
| ![Home Screen](screenshots/home.png) | ![Product Details](screenshots/product_details.png) | ![Cart](screenshots/cart.png) | ![Categories](screenshots/categories.png) |

## 🚀 Getting Started

### Prerequisites
- Flutter SDK (version 3.0 or higher)
- Dart SDK
- Android Studio / VS Code
- Xcode (for iOS development)

### Installation

1. **Clone the repository**
   ```bash
   git clone https://github.com/yourusername/crafty_bay.git
   cd crafty_bay
   ```

2. **Install dependencies**
   ```bash
   flutter pub get
   ```

3. **Set up Firebase**
   - Create a Firebase project at [Firebase Console](https://console.firebase.google.com/)
   - Add Android and iOS apps to your Firebase project
   - Download `google-services.json` and `GoogleService-Info.plist`
   - Place `google-services.json` in `android/app/`
   - Place `GoogleService-Info.plist` in `ios/Runner/`

4. **Run the application**
   ```bash
   flutter run
   ```

## 🏗️ Project Structure

```
lib/
├── app/                 # Application configuration and constants
├── core/                # Core services and utilities
├── features/            # Feature-specific modules
│   ├── auth/           # Authentication flow
│   ├── cart/           # Shopping cart functionality
│   ├── common/         # Shared components and models
│   ├── home/           # Home screen and main navigation
│   ├── product/        # Product browsing and details
│   └── wish_list/      # Wishlist functionality
└── main.dart           # Application entry point
```

## 🛠️ Technologies Used

- **[Flutter](https://flutter.dev)** - Cross-platform mobile development framework
- **[GetX](https://pub.dev/packages/get)** - State management, navigation, and dependency injection
- **[Firebase](https://firebase.google.com)** - Authentication, crashlytics, and analytics
- **[HTTP](https://pub.dev/packages/http)** - API communication
- **[Carousel Slider](https://pub.dev/packages/carousel_slider)** - Image sliders
- **[Pin Code Fields](https://pub.dev/packages/pin_code_fields)** - OTP verification

## 📱 Key Screens

1. **Splash Screen** - Initial loading screen
2. **Authentication Flow** - Sign up, login, and OTP verification
3. **Home Screen** - Featured products, categories, and promotions
4. **Product Listing** - Category-based product browsing
5. **Product Details** - Detailed product information
6. **Shopping Cart** - Cart management
7. **Wishlist** - Saved items
8. **Checkout Process** - Order placement

## 🤝 Contributing

Contributions are welcome! Please follow these steps:

1. Fork the repository
2. Create a new branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 👤 Author

**Sanaul Md. Perves**

- GitHub: [@sanaulparvej](https://github.com/sanaulparvej)
- LinkedIn: [Sanaul Parvej](https://linkedin.com/in/sanaul-parvej)

## 🙏 Acknowledgments

- Thanks to all contributors who have helped shape this project
- Inspired by modern e-commerce platforms and user experience design principles
- Built with ❤️ using Flutter and Firebase

---

<p align="center">
  Made with ❤️ using Flutter and Firebase
</p>
