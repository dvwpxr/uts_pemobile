import 'package:flutter/material.dart';

class AuctionDetailPage extends StatelessWidget {
  final Map<String, String> auction;

  AuctionDetailPage({required this.auction});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(auction['title']!),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(auction['image']!),
            SizedBox(height: 50),
            Text(
              auction['title']!,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 30),
            Text(auction['description']!),
            SizedBox(height: 30),
            Text(
              'Tawarkan Harga:',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Masukkan tawaran Anda',
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Logika untuk mengajukan tawaran
              },
              child: Text('Ajukan Tawaran'),
            ),
          ],
        ),
      ),
    );
  }
}
