import 'package:capstone_project/providers/app_opening_provider.dart';
import 'package:capstone_project/providers/auth_provider.dart';
import 'package:capstone_project/providers/plant_provider.dart';
import 'package:capstone_project/providers/plant_reminder_provider.dart';
import 'package:capstone_project/screens/app_opening_screens/app_desc_screen.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (context) => AuthProvider(),
        ),
        ChangeNotifierProvider<AppOpeningProvider>(
          create: (context) => AppOpeningProvider(),
        ),
        ChangeNotifierProvider<PlantProvider>(
          create: (context) => PlantProvider(),
        ),
        ChangeNotifierProvider<PlantReminderProvider>(
          create: (context) => PlantReminderProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Agriculture Capstone Project Alterra SIB 5',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          // colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: const AppDescScreen(),
      ),
    );
  }
}