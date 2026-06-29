# 🏥 Al Hadara / MediCenter (تطبيق الحضارة للخدمات الطبية) 🩺

[![Flutter Version](https://img.shields.io/badge/Flutter-%3E%3D%203.1.0-blue.svg?style=flat-square&logo=flutter)](https://flutter.dev)
[![Dart Version](https://img.shields.io/badge/Dart-%3E%3D%203.1.0-teal.svg?style=flat-square&logo=dart)](https://dart.dev)
[![GetX State Management](https://img.shields.io/badge/State%20Management-GetX%20%5E4.6.6-purple.svg?style=flat-square)](https://pub.dev/packages/get)
[![Localization](https://img.shields.io/badge/Localization-Arabic%20%7C%20English-orange.svg?style=flat-square)](#-localization-multi-language-support)

A comprehensive, localized digital healthcare and medical booking application (also referred to as **MediCenter** / **Al Hadara**) built using **Flutter** and **GetX**. **Al Hadara (الحضارة)** simplifies operations for medical ecosystems (targeting regional markets, including Syria). It bridges the gap between **Patients (Sicks)**, **Doctors**, and **Medical Centers/Laboratories/Clinics**, enabling smooth scheduling, profile management, electronic health records, and chat features.

The application communicates with a hosted production REST API backend: **Medicore Backend** (`https://medicore-production.up.railway.app`).

---

## 📖 Table of Contents
- [✨ Key Features](#-key-features)
- [🌐 Localization (Multi-Language Support)](#-localization-multi-language-support)
- [🛠️ Tech Stack & Libraries](#%EF%B8%8F-tech-stack--libraries)
- [🏗️ Architecture & Project Structure](#%EF%B8%8F-architecture--project-structure)
- [🚀 Getting Started](#-getting-started)
- [⚙️ Backend & API Integration](#%EF%B8%8F-backend--api-integration)
- [🎨 Design System & Fonts](#-design-system--fonts)
- [👥 Team Collaboration Structure](#-team-collaboration-structure)

---

## ✨ Key Features & Role Ecosystems

The application enforces strict **Role-Based Access Control (RBAC)**, dynamically rendering dedicated interfaces and features depending on the authenticated user's role:

### 📱 1. Patients (Sick User Portal / Patient Companion)
*   **Medical Search & Discovery:** Browse and search for medical centers, specialized clinics, laboratories, and doctors in different Syrian governorates (Damascus, Aleppo, Homs, etc.).
*   **Dynamic Appointment Booking:** Interactively book medical appointments at specific slots, select review types (consultations, follow-ups), and manage/delete appointments with conflict-checking mechanisms.
*   **Medical Files & Analysis:** View personal laboratory analysis results, prescriptions, and medical test summaries.
*   **Interactive Messaging:** Built-in chat functionality with doctors and clinics.
*   **Feedback System:** Submit reports and suggestions directly to the platform administration to report bugs or request improvements.

### 🩺 2. Clinical Doctor Portal
*   **Detailed Profile Setup:** Complete professional credentials, select specializations (e.g. Cardiology, Pediatrics, General Surgery, Family Medicine), and input certificates.
*   **Schedule Management:** Define working days, starting hours, and ending hours.
*   **Appointment Tracking & EHR:** View and manage booked appointments, patient records, and history clinical data.

### 🏢 3. Medical Centers & Clinic Administrators
*   **Interactive Dashboard:** Centralized control over clinics, laboratories, doctors, available medical services, and scheduling availability.
*   **Doctor Allocation:** Add and assign doctors to specific clinics within the medical center.
*   **Patient Intake & Reception:** Receptionists can register new patients directly into the medical center's database.
*   **Service Definition:** Define services and laboratory test categories offered.

---

## 🌐 Localization (Multi-Language Support)

The application features full dual-language support (**Arabic & English**) handled natively through GetX Translations:
*   Translates UI components, input forms, error messages, and guide texts.
*   Persistent language selection stored locally using `SharedPreferences`.

---

## 🛠️ Tech Stack & Libraries

The app leverages modern dependencies to maintain scalability and speed:

| Package | Version | Purpose |
| :--- | :--- | :--- |
| [**get**](https://pub.dev/packages/get) | `^4.6.6` | Reactive state management, localization, routing, and controller injection |
| [**http**](https://pub.dev/packages/http) | `^1.1.0` | Communicating with the remote REST API hosted on Railway |
| [**shared_preferences**](https://pub.dev/packages/shared_preferences) | `^2.2.3` | Local persistent storage for auth tokens, selected identity, and language preferences |
| [**image_picker**](https://pub.dev/packages/image_picker) | `^1.0.8` | Picking profile and certificate images from gallery/camera |
| [**dots_indicator**](https://pub.dev/packages/dots_indicator) | `^3.0.0` | Navigation page dot indicators for patient and doctor onboarding flows |
| [**flutter_otp_text_field**](https://pub.dev/packages/flutter_otp_text_field) | `^1.1.3+2` | Custom OTP code verification layouts for password recovery |
| [**loading_indicator**](https://pub.dev/packages/loading_indicator) | `^3.1.1` | Modern loading spin animations |
| [**intl**](https://pub.dev/packages/intl) | `^0.19.0` | Date formatting and localization tools |

---

## 🏗️ Architecture & Project Structure

The project separates files cleanly by feature modules and functional layers:

```bash
lib/
├── Constant/           # App theme colors, icons, lists (governorates, specialities, blood types)
├── Controller/         # GetX controllers for fetching and updating data
│   ├── Auth/           # Splash and login authentication logic
│   └── app/            # Controllers for center info, lab results, and appointments
├── Locale/             # Custom translations (Local.dart, Locale_Controller.dart)
├── Middelware/         # Auth verification guards
├── Model/              # JSON-to-Dart models (Appointments, Clinic, Doctor, Lab, Sick, Service)
├── Service/            # Remote API integrations
│   ├── App/            # Services for deleting/booking appointments, loading lab details
│   └── Auth/           # Signin, Signup, and multi-user info completion services
├── View/               # General UI Screens
│   ├── App/            # Patient screens (Personal page, Clinic views, Info displays)
│   ├── Auth/           # Signin, Signup, Password resets, and OTP entries
│   ├── OnBording/      # Onboarding flows for doctors and patients
│   └── Setting/        # Feedback, suggestions, and reports pages
├── Widget/             # Global reusable UI widgets
├── Hamed/              # Dedicated module for Center & Doctor Dashboard views (see below)
└── main.dart           # Route registration and application start
```

---

## 🚀 Getting Started

### Prerequisites
*   Install [Flutter SDK](https://docs.flutter.dev/get-started/install) (`>= 3.1.0`).
*   Configure an Android/iOS emulator or connect a physical device.

### Setup
1. Clone this repository:
   ```bash
   git clone https://github.com/hassanmohammad0010-create/Al_Hadara.git
   ```
2. Navigate to the project directory:
   ```bash
   cd Al_Hadara
   ```
3. Fetch dependencies:
   ```bash
   flutter pub get
   ```
4. Run the application:
   ```bash
   flutter run
   ```

---

## ⚙️ Backend & API Integration

All network service classes point to the secure production backend:
*   **Base URL:** `https://medicore-production.up.railway.app/api/`
*   **Database:** Relational schema backed by MySQL server.
*   **Authentication:** User details and auth tokens are persisted inside `SharedPreferences` as `token`, `id`, and `identity`. Requests use Bearer tokens for authenticated endpoints.

---

## 🎨 Design System & Fonts

To ensure premium medical aesthetics, the application applies cohesive tokens:
*   **Primary Teal Color:** `#258999` (Teal 🟩) - Establishes professional medical trust.
*   **Secondary Slate Color:** `#0C2E33` (Dark Slate Teal) - Provides premium contrast.
*   **Typography:** Customized using Google Fonts:
    *   `MadimiOne` (For main headers)
    *   `Pacifico` (Stylish decorative accents)
    *   `Gabriela` (Sub-headers & section titles)
    *   `AbhayaLibre` (High-readability paragraphs & user labels)

---

## 👥 Team Collaboration Structure

This repository uses a modular structure to support collaborative parallel development.
*   The **`lib/Hamed/`** directory encapsulates independent modules containing dedicated Controllers, Models, Functions, and Views for:
    *   **CenterPages:** Medical Center homepages, Doctor additions, Lab detail updates, and Clinic setups.
    *   **doctorPage.dart:** Doctor-specific dashboards, appointment requests, and profile updates.
    *   **SharedPage:** Appointment booking wizards (`bookAppointmentPage.dart`) and settings.

---

*Developed with ❤️ as a modern Healthcare and Clinic Booking solution.*
