# socialmediaapp

A new Flutter project.

## 📱 Overview

SocialConnect is a modern social media application inspired by Instagram, developed using **Flutter** and **Dart** for cross-platform mobile development. The app allows users to connect with friends, share posts, watch reels, chat in real-time, and discover new content.

The application uses **Firebase** for authentication, cloud storage, real-time database operations, and media management, providing a secure and scalable social networking experience.

---

## ✨ Features

### 🚀 User Authentication
- User Registration
- Login & Logout
- Secure Firebase Authentication
- Password Reset
- Email Verification

### 🎬 Reels
- Short video sharing
- Vertical scrolling feed
- Like and comment on reels
- Video playback controls

### 🏠 Home Feed
- View posts from followed users
- Like posts
- Comment on posts
- Share content
- Real-time feed updates

### 🔍 Search
- Search users
- Discover trending content
- Explore new profiles
- Search posts and reels

### 💬 Real-Time Chat
- One-to-one messaging
- Instant message delivery
- Online status indicator
- Message timestamps

### 👤 User Profile
- Profile photo management
- Bio and personal information
- Posts grid view
- Followers & Following count
- Edit profile functionality

### 📸 Post Management
- Upload images
- Add captions
- Delete posts
- View post details

### ❤️ Social Interaction
- Follow/Unfollow users
- Like posts and reels
- Comment system
- User engagement tracking

---

## 📱 Application Screens

- Splash Screen
- Login Screen
- Sign Up Screen
- Home Feed Screen
- Search Screen
- Reels Screen
- Chat List Screen
- Individual Chat Screen
- Profile Screen
- Edit Profile Screen
- Post Upload Screen
- Comments Screen

---

## 🛠️ Technologies Used

| Technology | Purpose |
|------------|---------|
| Flutter | Cross-platform App Development |
| Dart | Programming Language |
| Firebase Authentication | User Authentication |
| Cloud Firestore | Database Management |
| Firebase Storage | Media Storage |
| Firebase Messaging | Push Notifications |
| Provider / GetX | State Management |
| Image Picker | Image Selection |
| Video Player | Reel Playback |

---

## 🏗️ Architecture

The project follows a clean and scalable architecture:

```
lib/
│
├── models/
├── screens/
│   ├── splash/
│   ├── auth/
│   ├── home/
│   ├── reels/
│   ├── search/
│   ├── chat/
│   └── profile/
│
├── widgets/
├── services/
├── providers/
├── utils/
└── main.dart
```

---

## 🔥 Firebase Services Used

### Firebase Authentication
- Email & Password Login
- User Registration
- Session Management

### Cloud Firestore
- User Data
- Posts
- Comments
- Followers & Following
- Chat Messages

### Firebase Storage
- Profile Images
- Post Images
- Reel Videos

### Firebase Cloud Messaging
- Push Notifications
- Message Alerts
- Social Activity Notifications

---

## 📂 Database Collections

### Users
```json
{
  "uid": "",
  "username": "",
  "email": "",
  "bio": "",
  "profileImage": ""
}
```

### Posts
```json
{
  "postId": "",
  "uid": "",
  "imageUrl": "",
  "caption": "",
  "likes": []
}
```

### Messages
```json
{
  "senderId": "",
  "receiverId": "",
  "message": "",
  "timestamp": ""
}
```

---

## 🚀 Installation

### Clone Repository

```bash
git clone https://github.com/your-username/SocialConnect.git
```

### Navigate to Project

```bash
cd SocialConnect
```

### Install Dependencies

```bash
flutter pub get
```

### Configure Firebase

1. Create a Firebase project.
2. Add Android application.
3. Download `google-services.json`.
4. Place it inside:

```
android/app/
```

### Run Application

```bash
flutter run
```

---

## 📸 Key Functionalities

✔ User Authentication

✔ Upload Posts

✔ Like & Comment System

✔ Real-Time Chat

✔ User Search

✔ Follow / Unfollow

✔ Reels Section

✔ Profile Management

✔ Firebase Integration

✔ Responsive UI

---

## 🎯 Future Enhancements

- Story Feature
- Group Chat
- Voice Messages
- Video Calling
- Live Streaming
- Saved Posts
- Dark Mode
- AI Content Recommendations
- Push Notification Enhancements
- Multi-language Support

---

## 👩‍💻 Developer

**Bharti**

Flutter Developer

### Skills
- Flutter
- Dart
- Firebase
- REST APIs
- Git & GitHub
- Android Development
- UI/UX Design

---

## 📄 License

This project is created for educational and portfolio purposes.

© 2026 Bharti Thakur. All Rights Reserved.
