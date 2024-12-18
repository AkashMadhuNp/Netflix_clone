import 'package:apifinal/screens/Splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main(){
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      title: 'Netflix clone',
      themeMode: ThemeMode.dark,
      
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple).copyWith(background: Colors.black),
        useMaterial3: true,
        fontFamily: GoogleFonts.ptSans().fontFamily,
        textTheme:const TextTheme(
          bodyLarge: TextStyle(color: Colors.white, fontSize: 24),
          bodyMedium: TextStyle(color: Colors.white,fontSize: 20),
        ),

        
      ),
      debugShowCheckedModeBanner: false,
      home:const SplashScreen(),
    );
  }
}