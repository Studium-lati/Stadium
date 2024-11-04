Here's the updated section with the clarification note added:

---

# User App for Stadium Reservation

## Overview
The **User App** allows users to browse, view, and book small stadiums for their events. The app includes a Match Making feature to help users find other players to join their game. Future enhancements are planned to improve the user experience and add additional features.

**Note**: the main branch is Arjeeah branch

> **Note**: The backend for this app is hosted on localhost. Please contact the developer to turn on the backend if you’d like to test the app. Contact me at 0911716177 or argea2004@gmail.com.

**Note**: Problem resolved.

## Planned Enhancements
The User App will undergo further improvements, including:
- **Enhanced User Interface**: Optimizing the UI for a more intuitive and visually appealing user experience.
- **Optimized Booking and Search Functions**: Improving the speed and functionality of search and booking to reduce loading times and increase usability.
- **New Features**: Adding more features to enhance the Match Making and booking experience for users.

## Features
- **Browse Stadiums**: Users can retrieve a list of available stadiums from the server.
- **View Stadium Location**: Google Maps integration allows users to see each stadium's location.
- **Check Availability**: Real-time availability fetched from the backend to help users find open slots.
- **Reservation System**: Users can make reservations and receive confirmation via API calls.
- **User Profile**: Users can view and manage their reservation history.
- **Match Making**: Users can connect with other players looking to join a game at a specific stadium.
- **Chat Feature**: When a match is successfully generated through the Match Making feature, users can initiate and participate in a chat with other players to discuss game details.

> **Note**: A match requires at least two users to be generated. Only when a match is confirmed with multiple users can the chat feature be activated and used for communication.

## Tech Stack
- **Frontend**: [Flutter](https://flutter.dev/)
- **Backend**: [Laravel](https://laravel.com/) REST API (localhost)
- **Database**: SQLite (locally), synced with MySQL (server-side)

## Getting Started

### Prerequisites
- [Flutter SDK](https://flutter.dev/docs/get-started/install)

### REST API Setup

---

This added note helps clarify that the chat feature is only available once two or more users are part of a confirmed match.