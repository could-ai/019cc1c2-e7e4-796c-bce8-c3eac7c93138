import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:couldai_user_app/layout/admin_layout.dart';
import 'package:couldai_user_app/screens/dashboard_page.dart';
import 'package:couldai_user_app/screens/users_page.dart';
import 'package:couldai_user_app/screens/settings_page.dart';

void main() {
  runApp(const AdminApp());
}

class AdminApp extends StatelessWidget {
  const AdminApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Admin Dashboard',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF212332),
        textTheme: GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme)
            .apply(bodyColor: Colors.white),
        canvasColor: const Color(0xFF2A2D3E),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const AdminLayout(child: DashboardPage()),
        '/users': (context) => const AdminLayout(child: UsersPage()),
        '/settings': (context) => const AdminLayout(child: SettingsPage()),
      },
    );
  }
}
