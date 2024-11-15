import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'presentation/pages/auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider
import 'presentation/pages/login_page.dart'; // Mengimpor halaman login

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => AuctionProvider(),
      child: MaterialApp(
        title: 'E-Pelelangan',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: LoginPage(), // Menampilkan halaman login sebagai halaman awal
      ),
    );
  }
}
