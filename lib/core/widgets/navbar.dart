import 'package:voltway_mobile/configs/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Navbar extends StatefulWidget {
  const Navbar({super.key});

  @override
  State<Navbar> createState() => _NavbarState();
}

class _NavbarState extends State<Navbar> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: ListView(
      children: const <Widget>[
        UserAccountsDrawerHeader(
            decoration: BoxDecoration(color: Colors.black12),
            currentAccountPicture: CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://www.fairtravel4u.org/wp-content/uploads/2018/06/sample-profile-pic.png"),
            ),
            accountName: Text("Elias Mansouri"),
            accountEmail: Text("eliasmansouri05@gmail.com")),
        ListTile(
          leading: Icon(Icons.directions_car),
          title: Text("Your cars"),
        )
      ],
    ));
  }
}
