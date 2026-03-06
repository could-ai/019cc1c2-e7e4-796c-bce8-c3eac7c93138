import 'package:flutter/material.dart';

class AdminLayout extends StatefulWidget {
  final Widget child;

  const AdminLayout({super.key, required this.child});

  @override
  State<AdminLayout> createState() => _AdminLayoutState();
}

class _AdminLayoutState extends State<AdminLayout> {
  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width >= 1100;
    final isTablet = MediaQuery.of(context).size.width >= 850 && MediaQuery.of(context).size.width < 1100;

    return Scaffold(
      appBar: !isDesktop && !isTablet
          ? AppBar(
              backgroundColor: const Color(0xFF2A2D3E),
              title: const Text("Admin Panel"),
            )
          : null,
      drawer: !isDesktop && !isTablet ? const SideMenu() : null,
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            if (isDesktop || isTablet)
              const Expanded(
                // default flex = 1
                // and it takes 1/6 part of the screen
                child: SideMenu(),
              ),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: widget.child,
            ),
          ],
        ),
      ),
    );
  }
}

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: const Color(0xFF2A2D3E),
      child: ListView(
        children: [
          DrawerHeader(
            child: Center(
              child: Icon(
                Icons.admin_panel_settings,
                size: 50,
                color: Colors.white.withOpacity(0.8),
              ),
            ),
          ),
          DrawerListTile(
            title: "Dashboard",
            icon: Icons.dashboard,
            press: () {
              Navigator.pushReplacementNamed(context, '/');
            },
          ),
          DrawerListTile(
            title: "Users",
            icon: Icons.people,
            press: () {
              Navigator.pushReplacementNamed(context, '/users');
            },
          ),
          DrawerListTile(
            title: "Settings",
            icon: Icons.settings,
            press: () {
              Navigator.pushReplacementNamed(context, '/settings');
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    super.key,
    required this.title,
    required this.icon,
    required this.press,
  });

  final String title;
  final IconData icon;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      horizontalTitleGap: 0.0,
      leading: Icon(
        icon,
        color: Colors.white54,
        size: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
