import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../auction_provider.dart'; // Pastikan untuk mengimpor AuctionProvider
import '../auction_detail_page.dart';

class CarCategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Provider.of<AuctionProvider>(context);

    // Contoh data lelang untuk kategori Mobil
    final List<Map<String, String>> filteredAuctions = [
      {
        'title': 'Land Cruiser 2023',
        'description': 'Mobil sedan mewah dengan teknologi terbaru.',
        'image': 'assets/images/mobil/mobil.png'
      },
      {
        'title': 'Honda Civic 2020',
        'description': 'Mobil sporty dengan performa tinggi.',
        'image': 'assets/images/mobil/honda.png'
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: Text('Kategori: Mobil'),
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
