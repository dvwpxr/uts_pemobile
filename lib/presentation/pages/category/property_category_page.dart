import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider
import '../auction_detail_page.dart';

class PropertyCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuctionProvider>(context);

    // Contoh data lelang untuk kategori Properti
    final List<Map<String, String>> filteredAuctions = [
      {
        'title': 'Rumah Minimalis',
        'description': 'Rumah dengan desain modern dan konsep terbuka.',
        'image': 'assets/images/properti/rumah.png'
      },
      {
        'title': 'Apartemen Jakarta',
        'description': 'Apartemen strategis di pusat kota.',
        'image': 'assets/images/properti/apart.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: Properti'),
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
                    width: 150.0,
                    height: 150.0,
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
