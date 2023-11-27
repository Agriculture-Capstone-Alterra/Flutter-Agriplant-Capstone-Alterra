import 'package:capstone_project/providers/auth_provider.dart';
import 'package:capstone_project/providers/search_page_provider.dart';
import 'package:capstone_project/screens/autentikasi_screens/login_screen.dart';
// import 'package:capstone_project/screens/autentikasi_screens/login_screen.dart';
import 'package:capstone_project/screens/navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<SearchPageProvider>(
          create: (context) => SearchPageProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => AuthProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Agriculture Capstone Project Alterra SIB 5',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home:const NavBar(),
      ),
    );
  }
}