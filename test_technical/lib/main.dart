import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:test_technical/feature/auth/viewmodels/viewmodel_login.dart';
import 'feature/auth/view/login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Menambahkan beberapa provider
        ChangeNotifierProvider<LoginViewModel>(create: (_) => LoginViewModel()),
        // Add other providers here if needed
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: LoginView(),
      ),
    );
  }
}
