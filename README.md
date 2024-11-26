Tech News

Overview
Tech News is a mobile application developed using Flutter. It provides users with access to the latest technology news and features an AI-powered chatbot for answering questions and describing images. The app utilizes Firebase for user authentication, Dio for API integration, and Shared Preferences for local storage. The project focuses on delivering a streamlined user experience for tech enthusiasts.

Features
• Splash Screen: Visually appealing introduction screen when the app launches.
• User Authentication: Secure login and registration using Firebase.
• Home Page: Displays technology news in a list view with card components.
• Article Detail Page: Detailed view of news articles with the article’s image, title, description, source, and publication date.
• Chatbot Functionality: An AI-powered chatbot capable of answering user queries and describing images.

Technologies Used
• Flutter: Cross-platform framework for mobile app development.
• Dio: HTTP client for Dart, used to fetch tech news from external APIs.
• Firebase: Used for user authentication and secure login processes.
• Shared Preferences: Local storage for user preferences.
• Other Packages:
o cupertino_icons
o equatable
o dartz
o flutter_bloc
o bloc
o shared_preferences
o dio
o cached_network_image
o font_awesome_flutter
o flutter_gemini
o image_picker
o dash_chat_2
o splashify
o firebase_core
o firebase_auth
o awesome_dialog

Installation
1. Clone the repository:
git clone omarhefnawy/Gemini_app (github.com)
cd  Gemini_app-master
2. Install dependencies:
Run the following command to install the required dependencies:
flutter pub get
3. Configure Firebase:
Ensure you have your Firebase project set up and add the google-services.json file (for Android) and GoogleService-Info.plist (for iOS) in the appropriate directories.
4. Run the app:
flutter run

Project Structure
lib/
├── core/
│   └── shared/
│       ├── const.dart
│       └── navigate.dart
└── features/
    ├── auth/
    │   └── presentation/
    │       ├── screens/
    │       │   ├── login.dart
    │       │   └── sign_up.dart
    │       └── widgets/
    │           ├── custom_textbutton.dart
    │           ├── divider.dart
    │           ├── login_email_password.dart
    │           └── text_field.dart
    ├── chat_boot/
    │   └── presentation/
    │       └── chat_boot.dart
    └── tec_articles/
        ├── data/
        │   ├── model/
        │   │   └── tech_news_model.dart
        │   ├── repo_impl/
        │   │   └── tech_repo_impl.dart
        │   └── remote/
        │       └── tech_by_remote.dart
        ├── domain/
        │   ├── entities/
        │   │   └── tech_article.dart
        │   ├── repo/
        │   │   └── tech_article_repo.dart
        │   └── usecase/
        │       └── get_tech_usecase.dart
        └── presentation/
            └── screens/
                ├── article_news.dart
                └── article_info.dart

Challenges and Solutions
• State Management: Managed using BLoC (Business Logic Component) architecture to separate business logic from the UI.
• AI Integration: Integrated AI chatbot using the flutter_gemini package, providing answers to user questions and image descriptions.

Future Enhancements
• Expand AI Capabilities: Improve the chatbot’s intelligence and accuracy.
• User Feedback: Allow users to rate articles and chatbot interactions.
• Bookmarking Feature: Let users save articles for later reading.

License
This project is licensed under the MIT License - see the LICENSE file for details.




Contact
For more information, please contact:
• Ashraf Abdo                       Link: https://www.linkedin.com/in/ashraf-abdo/
• Omar Hefnawy                 Link: omarhefnawy (github.com)
