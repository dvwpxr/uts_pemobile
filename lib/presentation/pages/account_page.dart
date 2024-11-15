import 'package:flutter/material.dart';

class AccountPage extends StatelessWidget {
  final String username;

  AccountPage({required this.username});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Halo, $username',
        style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
      ),
    );
  }
}
