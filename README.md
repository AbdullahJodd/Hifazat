# 🛡️ Hifazat – Your Safety Ally

Hifazat is a **Flutter-based women safety mobile application** designed to provide quick emergency assistance, legal awareness, and access to essential contacts. The app focuses on **simplicity, reliability, and rapid response** in critical situations.

---

## 🚀 Features

### 🔐 Authentication
- Email & password signup/login using Firebase Authentication
- Secure user session handling

### 🆘 SOS Emergency Button
- Prominent SOS button with animated feedback
- Logs SOS alerts to Firebase Firestore for backend monitoring
- Designed for quick access during emergencies

### ⚖️ Laws & Legal Awareness
- Displays laws related to women and civilian rights in Pakistan
- Data fetched dynamically from Firebase Firestore
- Clean, readable UI with expandable sections

### 📞 Emergency Contacts
- Predefined emergency and women safety contacts
- Expandable contact cards
- Easily extendable via Firebase backend

### 👤 User Profile
- Displays user information (Name, Age, Gender, City)
- Profile data stored securely in Firebase
- Logout functionality

### 🎨 UI & UX
- Custom branded splash screen
- Soft background themes related to safety & protection
- Responsive layout across devices

---

## 🛠️ Tech Stack

- **Flutter (Dart)**
- **Firebase**
  - Authentication
  - Cloud Firestore
  - Storage
- **Material 3 UI**
- Android-first deployment

---

## 📦 Project Structure

```text
lib/
├── screens/
│   ├── splash/
│   ├── auth/
│   ├── sos/
│   ├── laws/
│   ├── contacts/
│   └── profile/
├── services/
│   ├── auth_service.dart
│   └── sos_service.dart
├── widgets/
├── utils/
├── app.dart
└── main.dart

