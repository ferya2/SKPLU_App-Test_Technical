# test_technical

# Project Overview:
Project ini dikembangkan menggunakan Flutter dengan arsitektur MVVM (Model-View-ViewModel) untuk memisahkan logika bisnis dari UI. State management yang digunakan adalah Provider untuk mengelola dan mengalirkan data di seluruh aplikasi.

# Note
- Project Menggunakan Data Dummy JSON local untuk login
- Project Menggunakan Arsitektur MVVM dan State Management Provider
- Logic hanya ada pada Login sisanya hanya tampilan UI
- Forgot password menambahkan beberapa validasi untuk snackbar

# Akun Login
- Username : 'UserXYZ'
- Password : 'XYZpass123'

## Project Stucture
    lib/
    │-- main.dart
    │-- core/
    |   |-- resource/    # resouce textstyle, colors, padding
    |   |-- routes/      # routing app navigation
    │-- Feature/         # Data models
    |   |-- Feature A
    │       |-- views/       # UI Screens (View layer)
    │       |-- viewmodels/  # ViewModels (Logic layer)
    │       |-- widgets/         # Reusable UI components

## Architecture:
    - Model → Menangani struktur data dan logika bisnis.
    - View → Mengelola tampilan UI dan mendengarkan perubahan dari ViewModel.
    - ViewModel → Menghubungkan Model dengan View serta mengelola state menggunakan Provider.

# Package
- Link Package(https://pub.dev/)
- Link Package Provider(https://pub.dev/packages/provider)
- Link Font Poppins(https://fonts.google.com/specimen/Poppins)