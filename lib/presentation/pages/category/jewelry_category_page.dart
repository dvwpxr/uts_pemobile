import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider
import '../auction_detail_page.dart';

class JewelryCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuctionProvider>(context);

    // Contoh data lelang untuk kategori Motor
    final List<Map<String, String>> filteredAuctions = [
      {
        'title': 'Cincin Berlian',
        'description': 'Cincin Berlian dengan 1 karat',
        'image': 'assets/images/perhiasan/berlian.png'
      },
      {
        'title': 'Cincin Emas',
        'description': 'Cincin Emas dengan 1 gram.',
        'image': 'assets/images/perhiasan/emas.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: Perhiasan'),
      ),
      body: ListView.builder(
        itemCount: filteredAuctions.length,
        itemBuilder: (context, index) {
          return Card(
            margin: EdgeInsets.all(10),
            child: InkWell(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AuctionDetailPage(auction: filteredAuctions[index]),
                  ),
                );
              },
              child: Column(
                children: [
                  Image.network(
                    filteredAuctions[index]['image']!,
                    width: 550.0,
                    height: 250.0,
                    fit: BoxFit.cover,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      filteredAuctions[index]['title']!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(filteredAuctions[index]['description']!),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
