# Elderly Care App

This is a Flutter-based mobile application designed to provide comprehensive care services for elderly users, including booking home healthcare services, transportation, doctor consultations, and more. The app ensures that seniors and their families can easily access essential services with ease and convenience.

## Features

- **Doctor Consultation**: Book online doctor consultations through the app (`DoctorConsultation.dart`).
- **Home Healthcare**: Manage and schedule home health care services (`HomeHealthCare.dart`).
- **Emergency Booking**: Immediate emergency bookings for critical situations (`EmergencyBooking.dart`).
- **Senior Plans**: Various care plans available for seniors (`plans.dart`).
- **Transportation**: Arrange transportation services (`Transportation.dart`).
- **Medication Supplies**: Order medical supplies directly (`medsupplies.dart`).
- **Payment Integration**: Secure payment system with a success confirmation page (`paymentPage.dart`, `paymentSuccess.dart`).
- **Task Management**: Manage and track tasks for senior care (`tasks.dart`).
- **User Interface**: Senior-specific home page with an easy-to-use interface (`seniorUserHomePage.dart`).
- **Animations**: Engaging user experience with custom animations (`requestAgainAnimation.dart`, `ssanimated.dart`).

## Project Structure

```
lib/
│   anshuthingy.dart
│   booking.dart
│   DoctorConsultation.dart
│   EmergencyBooking.dart
│   firebase_options.dart
│   HomeHealthCare.dart
│   HomeServices.dart
│   main.dart
│   medsupplies.dart
│   paymentPage.dart
│   paymentSuccess.dart
│   plans.dart
│   requestAgainAnimation.dart
│   reservation.dart
│   seniordeets.dart
│   seniorUserHomePage.dart
│   ssanimated.dart
│   tasks.dart
│   timePicker.dart
│   Transportation.dart
│   yourCaregiver.dart
```

### Key Files:

- **main.dart**: Entry point of the application.
- **firebase_options.dart**: Firebase configuration for backend services.
- **DoctorConsultation.dart, HomeHealthCare.dart, Transportation.dart**: Service-specific screens.
- **tasks.dart**: Task management for caregivers or senior activities.
- **paymentPage.dart & paymentSuccess.dart**: Payment integration and confirmation flow.

## Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) must be installed.
- Ensure you have a valid Firebase account and configure `firebase_options.dart` accordingly.

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/elderly-care-app.git
   cd elderly-care-app
   ```

2. Install dependencies:
   ```bash
   flutter pub get
   ```

3. Run the application:
   ```bash
   flutter run
   ```
