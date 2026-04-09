import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'screens/home_screen.dart';

class PortfolioApp extends StatelessWidget {
  const PortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Vaishnavi — Flutter Developer',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: const Color(0xFF0A0A08),
        colorScheme: const ColorScheme.dark(
          background: Color(0xFF0A0A08),
          surface: Color(0xFF111110),
          primary: Color(0xFFC8F060),
          secondary: Color(0xFFF0C860),
          onPrimary: Color(0xFF0A0A08),
          onBackground: Color(0xFFF0EDE6),
          onSurface: Color(0xFFF0EDE6),
        ),
        textTheme: GoogleFonts.syneTextTheme(
          ThemeData.dark().textTheme,
        ).apply(
          bodyColor: const Color(0xFFF0EDE6),
          displayColor: const Color(0xFFF0EDE6),
        ),
        useMaterial3: true,
      ),
      home: const HomeScreen(),
    );
  }
}
